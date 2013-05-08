module Pulse
  class PulseEvent < Reactor::Event


    protected

      def catch_exceptions(exception)
        trace(exception)
        unless exception.respond_to?(:code)
          trace(exception)
        end
      end
     
  end

end  
