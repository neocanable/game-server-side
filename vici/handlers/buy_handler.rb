module Vici
  class << BuyItemEventHandler.instance
    def execute(event)
      npc_id = event.npc_id
      merchand_item_id = event.merchand_item_id
      
    end
  end

  class << GetBuybackListEventHandler.instance
    def execute(event)
      npc_id = event.npc_id
      
    end
  end

  class << BuybackEventHandler.instance
    def execute(event)
      buyback_item_id = event.buyback_item_id
      
    end
  end

  class << MallBuyEventHandler.instance
    def execute(event)
      mall_item_id = event.mall_item_id
      quantity = event.quantity
      currency = event.currency
      
    end
  end
end
