module Vici
  class << UseContainerItemEventHandler.instance
    def execute(event)
      container_index = event.container_index
      slot_index      = event.slot_index
      character_id    = event._character_id

      character = Character.find_by_id(character_id)
      ItemInterface.use_item(container_index, slot_index, nil, character)

    end
  end

  class << UseItemEventHandler.instance
    def execute(event)
      item_id      = event.item_id
      character_id = event._character_id
      character = Character.find_by_id(character_id)

      ItemInterface.use_item(nil, nil, item_id, character)
    end
  end


  class << ConsumeEventHandler.instance
    def execute(event)
      character_id   = event.character_id
      static_item_id = event.static_item_id
      character_id   = event._character_id

    end
  end

  class << ConsumeSpecifyPositionEventHandler.instance
    def execute(event)
      character_id = event.character_id
      static_item_id = event.static_item_id
      container_index = event.container_index
      slot_index = event.slot_index

      character_id = event._character_id
      character    = Character.find_by_id(character_id)
      ItemInterface.consume_item(container_index, slot_index, static_item_id, character)
    end
  end
end
