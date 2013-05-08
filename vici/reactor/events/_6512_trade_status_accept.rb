#          id  6512
# description  交易已确认
#         api  trade.trade_status_accept
#      params  character_id
#        call  vici
#     execute  client

module Vici
  class TradeStatusAcceptEvent < ViciEvent
    include Singleton

    attr_accessor :character_id
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 6512
      Packet.pack([_event_id, @character_id, @_channel_id, @_account_id])
    end

    private
      def handler
        TradeStatusAcceptEventHandler.instance
      end
  end
end
