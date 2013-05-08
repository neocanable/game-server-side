#          id  6511
# description  交易已取消
#         api  trade.trade_status_cancel
#      params  
#        call  vici
#     execute  client

module Vici
  class TradeStatusCancelEvent < ViciEvent
    include Singleton

    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 6511
      Packet.pack([_event_id, @_channel_id, @_account_id])
    end

    private
      def handler
        TradeStatusCancelEventHandler.instance
      end
  end
end
