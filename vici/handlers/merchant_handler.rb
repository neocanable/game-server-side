module Vici
  class << GetSellListEventHandler.instance
    def execute(event)
      npc_id       = event.npc_id
      character_id = event._character_id
      character    = Character.find_by_id(character_id)    

      MerchantInterface.sell_item_list(character, npc_id)
    end
  end

  class << BuyItemEventHandler.instance
    def execute(event)
      npc_id = event.npc_id
      merchand_item_id = event.merchand_item_id
      character_id = event._character_id
      character    = Character.find_by_id(character_id)    

      MerchantInterface.buy_item(character, npc_id, merchand_item_id)
    end
  end

  class << SellItemEventHandler.instance
    def execute(event)
      container_type = event.container_type
      slot_index = event.slot_index
      character_id = event._character_id
      character    = Character.find_by_id(character_id)         

      MerchantInterface.sell_item_to_npc(character, container_type, slot_index)
    end
  end

  class << GetBuybackListEventHandler.instance
    def execute(event)
      npc_id = event.npc_id
      character_id = event._character_id
      character    = Character.find_by_id(character_id)

      MerchantInterface.get_buyback_list(character, npc_id)
    end
  end

  class << BuybackEventHandler.instance
    def execute(event)
      buyback_item_id = event.buyback_item_id
      character_id = event._character_id
      character    = Character.find_by_id(character_id)     

      MerchantInterface.buyback_item(character, buyback_item_id)
    end
  end
end
