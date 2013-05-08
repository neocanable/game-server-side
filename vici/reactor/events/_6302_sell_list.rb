#          id  6302
# description  贩卖列表
#         api  merchant.sell_list
#      params  npc_id item[merchant_item_id static_item_id stack:int price:int honor_price:int]
#        call  vici
#     execute  client

module Vici
  class SellListEvent < ViciEvent
    include Singleton

    attr_accessor :npc_id
    class Item
      attr_accessor :merchant_item_id
      attr_accessor :static_item_id
      attr_accessor :stack
      attr_accessor :price
      attr_accessor :honor_price
    end
    attr_accessor :items
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      items = @items.collect do |item|
        [item.merchant_item_id, item.static_item_id, item.stack, item.price, item.honor_price]
      end
      _event_id = 6302
      Packet.pack([_event_id, @npc_id, items, @_channel_id, @_account_id])
    end

    private
      def handler
        SellListEventHandler.instance
      end
  end
end
