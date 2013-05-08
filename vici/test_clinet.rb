#!/usr/local/ruby/bin/ruby

require 'rubygems'
require 'ruby-debug'

require 'socket'      # Sockets are in standard library
require 'json'

#streamSock.send("0039[\"account_login\",{\"name\":\"test_40000\"}]",0)
#streamSock.send("0035[\"account_login\",{\"name\":\"system\"}]",0)
#streamSock.send("0014[101,\"system\"]", 0)
#sleep 5
usage=<<-EOS
 #str = "[102,20,\"\\u6d4b\\u8bd5\\u90ae\\u4ef6\",\"\\u6d4b\\u8bd5\\u90ae\\u4ef6\",100,[[1,2],[3,4],[5,6]]]"
 #str = "[\"account_login\",{\"name\":\"system\"}]"
 #str = "[101,\"system\"]"
 #str = "[100,\"systec\"]"
 #str = "[98,\"demo\",1]"
 
 #str = "[20200,1]"
 #str = "[11000,10]"
EOS
x = 0;

puts usage

def pack_string(str)
  length = str.size.to_s.reverse
  (4 - str.size.to_s.size).times do  
    length.concat("0") 
  end 
  length.reverse.concat(str)
end

begin
  streamSock = TCPSocket.new('localhost', 10610) # 我自己
  while(true) do 
    print "input a protocal string:"
    str = gets.chomp
    str = pack_string(str)
    puts "send string: #{str}"
    streamSock.send(str, 0)
  end
  #streamSock.close
rescue Errno::ECONNREFUSED => e
  print e
  puts "链接异常"
end
