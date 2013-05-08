module Vici
  class << GetMallListEventHandler.instance
    def execute(event)
      tab = event.tab
      page = event.page
      character_id = event._character_id
      character = Character.find_by_id(character_id)

      MallInterface.list(character, tab, page)

    end
  end

  class << MallBuyEventHandler.instance
    def execute(event)
      mall_item_id = event.mall_item_id
      quantity = event.quantity
      currency = event.currency

      character_id = event._character_id
      character = Character.find_by_id(character_id)

      MallInterface.buy_item(mall_item_id, quantity, currency, character)

    end
  end

  class << MallGiveEventHandler.instance
    def execute(event)
      mall_item_id = event.mall_item_id
      quantity = event.quantity
      currency = event.currency
      target_character_name = event.target_character_name
      character_id = event._character_id
      character = Character.find_by_id(character_id)
      to_player = Character.find_by_name(target_character_name)
      MallInterface.buy_item(mall_item_id, quantity, currency, character, to_player)
    end
  end
end
