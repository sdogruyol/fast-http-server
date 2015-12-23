require "http"
require "option_parser"

class FastHttpServer < HTTP::StaticFileHandler
  INSTANCE = new
  property port

  def initialize(@publicdir = "./")
    @port = 3000
    super
  end

  def call(request)
    if request.path.not_nil! == "/"
      if File.exists?(Dir.working_directory + "/index.html")
        file_path = Dir.working_directory + "/index.html"
        return HTTP::Response.new(200, File.read(file_path), HTTP::Headers{"Content-Type": mime_type(file_path)})
      end
    end
    super
  end
end

at_exit do
  OptionParser.parse! do |opts|
    opts.on("-p ", "--port ", "port") do |port|
      FastHttpServer::INSTANCE.port = port
    end
  end

  fast_server = FastHttpServer::INSTANCE
  server = HTTP::Server.new("0.0.0.0", fast_server.port, [fast_server])
  puts "fast-http-server started on port #{fast_server.port}"
  server.listen
end
