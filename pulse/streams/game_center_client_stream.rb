module Pulse
  class  GameCenterClientStream < Reactor::ClientStream
    
    def process

    end

    def dispatcher
      PulseDispatcher.instance
    end

    protected
      def group_key
        :game_center
      end
  end
end  
