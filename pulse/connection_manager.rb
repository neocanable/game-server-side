module Pulse
  class ConnectionManager 
    include Singleton

    def game_center
      game_center_stream = stream_manager.get(:game_center).first
      raise "GameCenterMissingError" unless game_center_stream
      game_center_stream.connection
    end

    def pulse_center
      pulse_center_stream = stream_manager.get(:pulse_center)
    end

    private
      def stream_manager
        StreamManager.instance
      end
  end
end  
