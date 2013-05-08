module Pulse
  class PulseServerStream < Reactor::ServerStream
    
    def dispatcher
      PulseDispatcher.instance
    end

    protected

      def group_key
        :pulse_center
      end

      def connection_info(addr, port)
        PulseServerConnectionInfo.new(addr, port)
      end
  end
end  
