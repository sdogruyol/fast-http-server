require "http"

class FastHttpServer < HTTP::StaticFileHandler
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

fast_server = FastHttpServer.new "./"
server = HTTP::Server.new("0.0.0.0", 3000, [fast_server])
server.listen
puts "fast-http-server started on port 3000."
