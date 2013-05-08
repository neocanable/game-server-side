#          id  4312
# description  玩家获得钻石
#         api  player.player_diamond_gain
#      params  diamond_gained:int diamond
#        call  vici
#     execute  client

module Vici
  class PlayerDiamondGainEvent < ViciEvent
    include Singleton

    attr_accessor :diamond_gained
    attr_accessor :diamond
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 4312
      Packet.pack([_event_id, @diamond_gained, @diamond, @_channel_id, @_account_id])
    end

    private
      def handler
        PlayerDiamondGainEventHandler.instance
      end
  end
end
