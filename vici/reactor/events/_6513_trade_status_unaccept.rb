#          id  6513
# description  已经取消确认
#         api  trade.trade_status_unaccept
#      params  character_id
#        call  vici
#     execute  client

module Vici
  class TradeStatusUnacceptEvent < ViciEvent
    include Singleton

    attr_accessor :character_id
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 6513
      Packet.pack([_event_id, @character_id, @_channel_id, @_account_id])
    end

    private
      def handler
        TradeStatusUnacceptEventHandler.instance
      end
  end
end
