module Vici
  class << TradeInitiateEventHandler.instance
    def execute(event)
      target_character_id = event.target_character_id
      character_id = event._character_id
      
      character = Character.find_by_id(character_id)
      target_character = Character.find_by_id(target_character_id)

      TradeInterface.invite(character, target_character)
    end
  end

  class << TradeAcceptEventHandler.instance
    def execute(event)
      character_id = event._character_id
      character    = Character.find_by_id(character_id)

      TradeInterface.confirm(character)
    end
  end

  class << TradeUnacceptEventHandler.instance
    def execute(event)
      character_id = event._character_id
      character    = Character.find_by_id(character_id)     

      TradeInterface.cancel_confirm(character)
    end
  end

  class << TradeCancelEventHandler.instance
    def execute(event)
      character_id = event._character_id
      character    = Character.find_by_id(character_id)          

      TradeInterface.cancel(character)
    end
  end

  class << TradeSetMoneyEventHandler.instance
    def execute(event)
      money = event.money
      character_id = event._character_id
      character    = Character.find_by_id(character_id)

      TradeInterface.set_money(character, money)
    end
  end

  class << TradeSetItemEventHandler.instance
    def execute(event)
      trade_slot_index = event.trade_slot_index
      src_container_index = event.src_container_index
      src_slot_index = event.src_slot_index
      quantity = event.quantity
      character_id = event._character_id
      character    = Character.find_by_id(character_id)     

      TradeInterface.set_item(character, trade_slot_index, src_container_index, src_slot_index, quantity)
      
    end
  end

  class << TradeClearItemEventHandler.instance
    def execute(event)
      trade_slot_index = event.trade_slot_index
      character_id = event._character_id
      character    = Character.find_by_id(character_id)          

      TradeInterface.remove_item(character, trade_slot_index)
    end
  end
end
