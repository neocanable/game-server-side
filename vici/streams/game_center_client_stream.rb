module Vici
  class  GameCenterClientStream < Reactor::ClientStream
    def dispatcher
      ViciDispatcher.instance
    end

    protected
      def group_key
        :game_center
      end
  end
end  
