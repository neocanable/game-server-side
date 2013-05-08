module Vici
  module InterfaceHelper
    def sell_list_event(character, items, npc_id)
      merchant_items = items.collect do |item|
        merchant_item = SellListEvent::Item.new
        merchant_item.merchant_item_id = item[0]
        merchant_item.static_item_id   = item[1]
        merchant_item.stack            = item[2]
        merchant_item.price            = item[3]
        merchant_item.honor_price      = item[5]
        merchant_item
      end
      sell_list(npc_id, merchant_items, character.account_id)
    end

    def buyback_list_event(character, items)
      buyback_items = items.collect do |item|
        buyback_item = BuybackListEvent::Item.new
        buyback_item.buyback_item_id = item.id
        buyback_item.static_item_id  = item.static_item_id
        buyback_item.quantity        = item.quantity
        buyback_item.price           = item.buyback_price
        buyback_item
      end
      buyback_list(buyback_items, character.account_id)
    end
  end
end  

