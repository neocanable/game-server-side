#          id  6509
# description  物品变化
#         api  trade.trade_item_changed
#      params  character_id trade_slot_index static_item_id quantity
#        call  vici
#     execute  client

module Vici
  class TradeItemChangedEvent < ViciEvent
    include Singleton

    attr_accessor :character_id
    attr_accessor :trade_slot_index
    attr_accessor :static_item_id
    attr_accessor :quantity
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 6509
      Packet.pack([_event_id, @character_id, @trade_slot_index, @static_item_id, @quantity, @_channel_id, @_account_id])
    end

    private
      def handler
        TradeItemChangedEventHandler.instance
      end
  end
end
