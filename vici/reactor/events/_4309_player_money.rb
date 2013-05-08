#          id  4309
# description  玩家金钱
#         api  player.player_money
#      params  money
#        call  vici
#     execute  client

module Vici
  class PlayerMoneyEvent < ViciEvent
    include Singleton

    attr_accessor :money
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 4309
      Packet.pack([_event_id, @money, @_channel_id, @_account_id])
    end

    private
      def handler
        PlayerMoneyEventHandler.instance
      end
  end
end
