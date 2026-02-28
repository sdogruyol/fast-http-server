require "./spec_helper"

describe FastHttpServer do
  it "instantiates with defaults" do
    server = FastHttpServer.new
    server.port.should eq(3000)
  end
end
