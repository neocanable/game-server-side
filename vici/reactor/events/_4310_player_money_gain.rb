#          id  4310
# description  玩家获得金钱
#         api  player.player_money_gain
#      params  money_gained:int money
#        call  vici
#     execute  client

module Vici
  class PlayerMoneyGainEvent < ViciEvent
    include Singleton

    attr_accessor :money_gained
    attr_accessor :money
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 4310
      Packet.pack([_event_id, @money_gained, @money, @_channel_id, @_account_id])
    end

    private
      def handler
        PlayerMoneyGainEventHandler.instance
      end
  end
end
