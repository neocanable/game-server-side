module Reactor
  class AcceptStream < IOStream
    attr_reader :manager
    attr_reader :connection
    
    def initialize(socket, dispatcher, manager, connection_info = nil)
      @manager    = manager  
      @dispatcher = dispatcher
      create_connection(socket, connection_info)  
    end

    def process
      @dispatcher.dispatch(@connection)
    end

    def disconnect(stream)
      raise "disconnect should reload!!!"    
    end

    private
      def create_connection(socket, connection_info)
        @connection = Connection.new(socket, connection_info)
      end
  end
end  
