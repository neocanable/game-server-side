#          id  4311
# description  玩家钻石
#         api  player.player_diamond
#      params  diamond
#        call  vici
#     execute  client

module Vici
  class PlayerDiamondEvent < ViciEvent
    include Singleton

    attr_accessor :diamond
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 4311
      Packet.pack([_event_id, @diamond, @_channel_id, @_account_id])
    end

    private
      def handler
        PlayerDiamondEventHandler.instance
      end
  end
end
