module Reactor
  class IOStream
    
    def process
      raise "process should be overload!!!"
    end
    
    def self.dispatcher
      raise "dispatcher should be overload!!!"
    end

    private

      def stream_manager
        StreamManager.instance
      end

  end
end
