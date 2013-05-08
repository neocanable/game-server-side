include Reactor

module Pulse
  class PulseReactor < Reactor::Base
    include Singleton

    def init
      PulseServerStream.new(Conf::PULSE_HOST, Conf::PULSE_PORT)
      GameCenterClientStream.new(Conf::GAME_CENTER_HOST, Conf::GAME_CENTER_PORT)
    end

    def run
      while(true)
#        begin
          pulse.startup unless pulse.has_finish_initialize? 
          TASKS.each {|task| task.process(Tick.now) }
#        rescue Exception => e
#          puts e
#          game_center_stream.disconnect(game_center_stream) if e.message == "StreamDisconnectError"
#        end
        loop_stream # 基类方法
        Tick.wait_till_next_tick
      end
    end

    private
      
      def game_center_stream
        stream_manager.get(:game_center).first
      end

      def stream_manager
        StreamManager.instance
      end
      
      def pulse
        PulseWorker.instance
      end
  end
end

