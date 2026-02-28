require "http"
require "option_parser"

class FastHttpServer < HTTP::StaticFileHandler
  property port

  def initialize(@publicdir = "./", @directory_listing = true)
    @port = 3000

    super
  end

  def call(context)
    if path = context.request.path
      base = path.lchop("/").chomp("/")
      indexed_url = File.join(@publicdir, base, "index.html")

      if File.exists?(indexed_url)
        redirect_path = path.chomp("/") + "/index.html"
        redirect_to context, redirect_path
        return
      end
    end

    super
  end
end

# Defaults
directory = "./"
dir_listing = true

BANNER = <<-BANNER
usage: fast-http-server [-h] [-d DIR] [port] 

positional arguments:
    port                             specify alternate port [default: 3000]

optional arguments:
BANNER

if ENV["ENV"]? != "test"
  OptionParser.parse do |parser|
    parser.banner = BANNER

    parser.on("-h", "--help", "show this help message and exit") { puts parser; exit }
    parser.on("-d DIR", "--directory DIR", "specify a directory") { |dir| directory = dir }
    parser.on("-l LIST", "--listdir LIST", "enable/disable directory listing (yes/no)") do |k|
      dir_listing = false if k.downcase[0] == 'n'
    end

    parser.invalid_option { |opt| puts "Invalid option: #{opt}\n\n"; puts parser; exit }
    parser.missing_option { |opt| puts "Missing option for #{opt}\n\n"; puts parser; exit }
  end

  raise "Directory: '#{directory}' doesn't exist." unless Dir.exists?(directory)

  fast_server = FastHttpServer.new directory, dir_listing

  fast_server.port = ARGV[0]?.try(&.to_i?) || 3000 if ARGV.size >= 1

  server = HTTP::Server.new([HTTP::LogHandler.new, fast_server])
  server.bind_tcp "0.0.0.0", fast_server.port
  puts "fast-http-server started on port #{fast_server.port}" + (directory == "./" ? "" : " at #{directory}")

  server.listen
end
