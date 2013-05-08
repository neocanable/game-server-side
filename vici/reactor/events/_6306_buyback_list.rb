#          id  6306
# description  购回列表
#         api  merchant.buyback_list
#      params  item[buyback_item_id static_item_id quantity price:int]
#        call  vici
#     execute  client

module Vici
  class BuybackListEvent < ViciEvent
    include Singleton

    class Item
      attr_accessor :buyback_item_id
      attr_accessor :static_item_id
      attr_accessor :quantity
      attr_accessor :price
    end
    attr_accessor :items
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      items = @items.collect do |item|
        [item.buyback_item_id, item.static_item_id, item.quantity, item.price]
      end
      _event_id = 6306
      Packet.pack([_event_id, items, @_channel_id, @_account_id])
    end

    private
      def handler
        BuybackListEventHandler.instance
      end
  end
end
