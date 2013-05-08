module Vici
  class ViciServerStream < Reactor::ServerStream
    
    def dispatcher
      ViciDispatcher.instance
    end

    protected

      def group_key
        :vici_server
      end

      def connection_info(addr, port)
        ViciConnectionInfo.new(addr, port)
      end
  end
end  
