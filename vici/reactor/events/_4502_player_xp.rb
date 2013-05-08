#          id  4502
# description  玩家经验
#         api  player.player_xp
#      params  xp:int
#        call  vici
#     execute  client

module Vici
  class PlayerXpEvent < ViciEvent
    include Singleton

    attr_accessor :xp
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 4502
      Packet.pack([_event_id, @xp, @_channel_id, @_account_id])
    end

    private
      def handler
        PlayerXpEventHandler.instance
      end
  end
end
