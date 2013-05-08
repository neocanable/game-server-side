#          id  6510
# description  交易请求
#         api  trade.trade_status_initiate
#      params  target_character_id
#        call  vici
#     execute  client

module Vici
  class TradeStatusInitiateEvent < ViciEvent
    include Singleton

    attr_accessor :target_character_id
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 6510
      Packet.pack([_event_id, @target_character_id, @_channel_id, @_account_id])
    end

    private
      def handler
        TradeStatusInitiateEventHandler.instance
      end
  end
end
