require "./spec_helper"

FIXTURES_DIR = File.join(__DIR__, "fixtures")

def with_server(handler, &)
  server = HTTP::Server.new([handler])
  address = server.bind_unused_port("127.0.0.1")
  port = address.port

  spawn { server.listen }
  sleep 0.05.seconds

  yield port
ensure
  server.try(&.close)
end

describe FastHttpServer do
  it "instantiates with defaults" do
    server = FastHttpServer.new
    server.port.should eq(3000)
  end

  describe "E2E" do
    it "serves static file from root" do
      handler = FastHttpServer.new(FIXTURES_DIR, true)
      with_server(handler) do |port|
        response = HTTP::Client.get("http://127.0.0.1:#{port}/hello.txt")
        response.status_code.should eq(200)
        response.body.should eq("Hello, World!\n")
      end
    end

    it "serves index.html at root" do
      handler = FastHttpServer.new(FIXTURES_DIR, true)
      with_server(handler) do |port|
        response = HTTP::Client.get("http://127.0.0.1:#{port}/index.html")
        response.status_code.should eq(200)
        response.body.should contain("Root index")
      end
    end

    it "redirects root to index.html" do
      handler = FastHttpServer.new(FIXTURES_DIR, true)
      with_server(handler) do |port|
        response = HTTP::Client.get("http://127.0.0.1:#{port}/")
        response.status_code.should eq(302)
        response.headers["Location"]?.should eq("/index.html")
      end
    end

    it "redirects directory with trailing slash to index.html" do
      handler = FastHttpServer.new(FIXTURES_DIR, true)
      with_server(handler) do |port|
        response = HTTP::Client.get("http://127.0.0.1:#{port}/blog/")
        response.status_code.should eq(302)
        response.headers["Location"]?.should eq("/blog/index.html")
      end
    end

    it "redirects directory without trailing slash to index.html" do
      handler = FastHttpServer.new(FIXTURES_DIR, true)
      with_server(handler) do |port|
        response = HTTP::Client.get("http://127.0.0.1:#{port}/blog")
        response.status_code.should eq(302)
        response.headers["Location"]?.should eq("/blog/index.html")
      end
    end

    it "returns 404 for non-existent file" do
      handler = FastHttpServer.new(FIXTURES_DIR, true)
      with_server(handler) do |port|
        response = HTTP::Client.get("http://127.0.0.1:#{port}/nonexistent.txt")
        response.status_code.should eq(404)
      end
    end

    it "serves blog index after redirect" do
      handler = FastHttpServer.new(FIXTURES_DIR, true)
      with_server(handler) do |port|
        base = "http://127.0.0.1:#{port}"
        redirect = HTTP::Client.get("#{base}/blog")
        redirect.status_code.should eq(302)
        location = redirect.headers["Location"]
        location.should eq("/blog/index.html")
        response = HTTP::Client.get("#{base}#{location}")
        response.status_code.should eq(200)
        response.body.should contain("Blog index")
      end
    end
  end
end
