#          id  6515
# description  交易完成
#         api  trade.trade_status_complete
#      params  
#        call  vici
#     execute  client

module Vici
  class TradeStatusCompleteEvent < ViciEvent
    include Singleton

    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 6515
      Packet.pack([_event_id, @_channel_id, @_account_id])
    end

    private
      def handler
        TradeStatusCompleteEventHandler.instance
      end
  end
end
