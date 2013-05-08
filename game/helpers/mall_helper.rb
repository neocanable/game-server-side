module Vici
  module InterfaceHelper
    def mall_list_event(character, mall_items, tab, page, total_pages)
      items = mall_items.collect do |mall_item|
        item = MallListEvent::Item.new
        item.mall_item_id = mall_item.id
        item.static_item_id = mall_item.static_item_id
        item.stack = mall_item.stack
        item.diamond_price = mall_item.diamond_price
        item.voucher_price = mall_item.voucher_price
        item
      end
      mall_list(tab, page, total_pages, items, character.account_id)
    end
  end
end  

