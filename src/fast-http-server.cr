require "http"
require "option_parser"

class FastHttpServer < HTTP::StaticFileHandler
  INSTANCE = new
  property port

  def initialize(@publicdir = "./")
    @port = 3000
    super
  end

  def call(context)
    if context.request.path.not_nil! == "/"
      index_path = Dir.current + "/index.html"
      if File.exists?(index_path)
        return HTTP::Client::Response.new(200, File.read(index_path), HTTP::Headers{"Content-Type"=> mime_type(index_path)})
      end
    end
    super
  end
end

at_exit do
  OptionParser.parse! do |opts|
    opts.on("-p ", "--port ", "port") do |port|
      if port.to_s == "80"
        puts "You may need root(sudo) access to run on 80 port"
      end
      FastHttpServer::INSTANCE.port = port.to_i
    end
  end

  fast_server = FastHttpServer::INSTANCE
  server = HTTP::Server.new("0.0.0.0", fast_server.port, [HTTP::LogHandler.new, fast_server])
  puts "fast-http-server started on port #{fast_server.port}"
  server.listen
end
