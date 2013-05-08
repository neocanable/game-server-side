module Reactor
  class Event
    attr_reader :connection

    def load(packet, connection)
      raise "Event load should not be here"
    end

    def execute
      return unless handler.before_execute
      begin 
        handler.execute(self)
      rescue Exception => e
        catch_exceptions(e)
      end
      handler.after_execute
    end

    def dump
      raise "dump should be overload!!!"
    end
    
    protected 
      def catch_exceptions(exception)
        trace(exception)
      end

      def handler
        raise "Event handler should be overload!"
      end

    private 

      def trace(exception)
        STDERR.puts exception.message
        STDERR.puts exception.backtrace.map { |line| "  #{line}" }
      end
  end
end
