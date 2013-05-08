#          id  6508
# description  金币变化
#         api  trade.trade_money_changed
#      params  character_id money
#        call  vici
#     execute  client

module Vici
  class TradeMoneyChangedEvent < ViciEvent
    include Singleton

    attr_accessor :character_id
    attr_accessor :money
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 6508
      Packet.pack([_event_id, @character_id, @money, @_channel_id, @_account_id])
    end

    private
      def handler
        TradeMoneyChangedEventHandler.instance
      end
  end
end
