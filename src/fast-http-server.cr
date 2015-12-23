require "http"

class FastHttpServer < HTTP::StaticFileHandler
  def call(request)
    if request.path.not_nil! == "/"
      index_path = Dir.working_directory + "/index.html"
      if File.exists?(index_path)
        return HTTP::Response.new(200, File.read(file_path), HTTP::Headers{"Content-Type": mime_type(index_path)})
      end
    end
    super
  end
end

fast_server = FastHttpServer.new "./"
server = HTTP::Server.new("0.0.0.0", 3000, [fast_server])
server.listen
puts "fast-http-server started on port 3000."
