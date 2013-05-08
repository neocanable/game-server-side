#          id  4503
# description  玩家获得经验
#         api  player.player_xp_gain
#      params  xp_gained:int xp:int
#        call  vici
#     execute  client

module Vici
  class PlayerXpGainEvent < ViciEvent
    include Singleton

    attr_accessor :xp_gained
    attr_accessor :xp
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 4503
      Packet.pack([_event_id, @xp_gained, @xp, @_channel_id, @_account_id])
    end

    private
      def handler
        PlayerXpGainEventHandler.instance
      end
  end
end
