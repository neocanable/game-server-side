#          id  6802
# description  商品列表
#         api  mall.mall_list
#      params  tab:int page total_pages:int item[mall_item_id static_item_id stack:int diamond_price:int voucher_price:int]
#        call  vici
#     execute  client

module Vici
  class MallListEvent < ViciEvent
    include Singleton

    attr_accessor :tab
    attr_accessor :page
    attr_accessor :total_pages
    class Item
      attr_accessor :mall_item_id
      attr_accessor :static_item_id
      attr_accessor :stack
      attr_accessor :diamond_price
      attr_accessor :voucher_price
    end
    attr_accessor :items
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      items = @items.collect do |item|
        [item.mall_item_id, item.static_item_id, item.stack, item.diamond_price, item.voucher_price]
      end
      _event_id = 6802
      Packet.pack([_event_id, @tab, @page, @total_pages, items, @_channel_id, @_account_id])
    end

    private
      def handler
        MallListEventHandler.instance
      end
  end
end
