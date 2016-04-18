require 'socket'
require 'pry'

def start_server
  server = TCPServer.new 2000 # Server bound to port 2000
  me = TCPSocket.new 'localhost', 2000
  them = server.accept
  them.puts "Hello!"
  binding.pry
  output = Thread.new { while line = them.gets do puts line end }.join
  input = Thread.new { them.puts(gets.chomp) }
end

def start_client
  print "IP? "
  input = gets.chomp
  them = TCPSocket.new "#{input}", 2000
  binding.pry
  output = Thread.new { while line = them.gets do puts line end }.join
  input = Thread.new { them.puts(gets.chomp) }
end


print "'server' or 'client'? "
input = gets.chomp
if input == "server"
  start_server
elsif input == "client"
  start_client
end