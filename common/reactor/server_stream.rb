module Reactor
  class ServerStream < IOStream
    
    def initialize(addr, port)
      raise "Client's address should not be nil" if addr.blank?
      raise "Client's port invalid" if port.blank?

      listen(addr, port)
      stream_manager.add(group_key, self)
    end

    def dispatcher
      raise "Dispatcher should be not here"
    end

    def process
      begin
        client_socket = @socket.accept_nonblock
        stream = accept_new_stream(client_socket)
        stream_manager.add(group_key, stream)
      rescue Errno::EWOULDBLOCK, Errno::EAGAIN, Errno::ECONNABORTED,Errno::EPROTO
      rescue Exception => e
        puts "server #{group_key} down!"
        puts e
      end
    end


    def disconnect(stream)
      stream.connection.socket.close
      stream_manager.remove(group_key, stream)
    end

    protected

      def connection_info(addr, port)
        raise "Server connection_info should be reload!"
      end

      def group_key
        raise "Group-key not defined!!!"
      end

      def group_key
        raise "Group-key not defined!!"
      end

    private
      def listen(addr, port)
        @socket = TCPServer.new(addr, port)       
      end

      def accept_new_stream(socket)
        puts "accept new stream"
        TCPSocket.do_not_reverse_lookup = true
        address = socket.peeraddr[3]
        port    = socket.peeraddr[1]
        info    = connection_info(address, port)
        connection_stream = AcceptStream.new(socket, dispatcher, self, info) 
      end
  end
end
