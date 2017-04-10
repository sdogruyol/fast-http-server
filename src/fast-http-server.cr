require "http"
require "option_parser"

class FastHttpServer < HTTP::StaticFileHandler
  property port

  def initialize(@publicdir = "./")
    @port = 3000
    super
  end

  def call(context)
    if context.request.path.not_nil! == "/"
      index_path = @publicdir + "/index.html"
      if File.exists?(index_path)
        puts "#{index_path}"
        redirect_to context, "/index.html"
        return
      end
    end
    super
  end
end


directory : String  = "./"

BANNER =  <<-BANNER
usage: fast-http-server [-h] [-d DIR] [port] 

positional arguments:
    port                             specify alternate port [default: 3000]

optional arguments:
BANNER


at_exit do
  OptionParser.parse! do |parser|
    parser.banner = BANNER

    parser.on("-h", "--help", "show this help message and exit") { puts parser; exit }
    parser.on("-d DIR", "--directory DIR", "specify a directory") { |dir| directory = dir }

    parser.invalid_option{ |opt| puts "Invalid option: #{opt}\n\n"; puts parser; exit }
    parser.missing_option{ |opt| puts "Missing option for #{opt}\n\n"; puts parser; exit }
  end

  raise "Directory: '#{directory}' doesn't exist." unless Dir.exists?(directory)

  fast_server = FastHttpServer.new directory

  ARGV.map_with_index{ |arg, i|
    fast_server.port = ARGV[0].to_i?.nil? ? 8080 : ARGV[i].to_i
  } if ARGV.size >= 1

  server = HTTP::Server.new("0.0.0.0", fast_server.port, [HTTP::LogHandler.new, fast_server])
  puts "fast-http-server started on port #{fast_server.port}" + (directory == "./" ? "" : " at #{directory}")
  
  server.listen
end
