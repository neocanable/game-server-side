module Vici
  class ConnectionManager 
    include Singleton
    def event_pool
      event_pool_stream = stream_manager.get(:event_pool).first
      raise "EventPoolMissingError" unless event_pool_stream
      event_pool_stream.connection
    end

    def game_center
      game_center_stream = stream_manager.get(:game_center).first
      raise "GameCenterMissingError" unless game_center_stream
      game_center_stream.connection
    end

    def vici_server
      stream_manager.get(VICI_SERVER_NAME).first
    end

    def get_connection_by_account_id(account_id)
      # 留个
    end

    private
      def stream_manager
        StreamManager.instance
      end
  end
end  
