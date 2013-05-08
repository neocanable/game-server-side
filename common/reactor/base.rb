require 'singleton'
require 'socket'

module Reactor
  class Base
     
    def init; end
  
    def run
      while(true)
        loop_stream
        sleep 0.01
      end
    end
  
    protected

      def stream_manager
        StreamManager.instance
      end

    private

      def loop_stream
        stream_manager.each_stream do |stream|
          begin
            stream.process
          rescue Exception => e
            p trace_exception(e)
            stream_disconnect(stream)
          end
        end
      end
    
      def stream_disconnect(stream)
        if stream.respond_to?(:manager)
          stream.manager.disconnect(stream)
        else
          stream.disconnect(stream)
        end
      end
  
  end
end
