module Reactor
  class ClientStream < IOStream

    attr_reader :connection

    def initialize(addr, port)
      raise "Client's address invalid" if addr.blank?
      raise "Client's port invalid" if port.blank?
      create_connection(addr, port)
      stream_manager.add(group_key, self)  
    end

    def dispatcher
      raise "dispatcher should be reload!!!"
    end
  
    def process
      dispatcher.dispatch(@connection)
    end

    def disconnect(stream)
      reconnect
    end

    protected

      def reconnect
        begin 
          create_connection(@connection.connection_info.address, @connection.connection_info.port)
        rescue Errno::ECONNREFUSED
          puts "reconnect faild!!!"
        end
      end

      def connection_info(addr, port)
        ConnectionInfo.new(addr, port)
      end

    private

      def create_connection(addr, port)
        begin
          socket = TCPSocket.new(addr, port)
          info = connection_info(addr, port)
          @connection = Connection.new(socket, info)  
        rescue Errno::ECONNREFUSED, Errno::ETIMEDOUT,Errno::EHOSTUNREACH
          puts "#{group_key}  初始化失败, 尝试重新链接 #{addr}:#{port}"
          sleep 5
          retry
        end
      end

  end
end
