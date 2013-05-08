#          id  6514
# description  交易失败
#         api  trade.trade_status_failed
#      params  
#        call  vici
#     execute  client

module Vici
  class TradeStatusFailedEvent < ViciEvent
    include Singleton

    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 6514
      Packet.pack([_event_id, @_channel_id, @_account_id])
    end

    private
      def handler
        TradeStatusFailedEventHandler.instance
      end
  end
end
