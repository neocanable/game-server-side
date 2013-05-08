module Vici
  class << LootEventHandler.instance
    def execute(event)
      scene_object_id = event.scene_object_id
      character_id    = event._character_id
      
      scene_object_id = scene_object_id.to_s[1..-1].to_i

      character = Character.find_by_id(character_id)
      LootInterface.loot_item_list(scene_object_id, character)
      
    end
  end

  class << LootOneEventHandler.instance
    def execute(event)
      scene_object_id = event.scene_object_id
      object_item_id  = event.object_item_id
      character_id    = event._character_id
      scene_object      = SceneObject.find_by_id(scene_object_id.to_s[1..-1].to_i)
      character         = Character.find_by_id(character_id)     
      scene_object_item = SceneObjectItem.find_by_id(object_item_id)
      LootInterface.loot_one_item(scene_object, scene_object_item, character)
    end

  end

  class << LootAllEventHandler.instance
    def execute(event)
      scene_object_id = event.scene_object_id
      character_id    = event._character_id
      scene_object      = SceneObject.find_by_id(scene_object_id.to_s[1..-1].to_i)
      character       = Character.find_by_id(character_id)

      LootInterface.loot_all(scene_object, character)
    end
  end

  class << LootReleaseEventHandler.instance
    def execute(event)
      scene_object_id = event.scene_object_id
      character_id    = event._character_id
      character       = Character.find_by_id(character_id)
      LootInterface.close_loot_list(character, scene_object_id)
    end
  end

  class << LootCloseEventHandler.instance
    def execute(event)
      loot_id = event.loot_id
      loot    = Loot.find_by_id(loot_id)
      character_id    = event._character_id
      character       = Character.find_by_id(character_id)          

      LootInterface.roll(character, loot, Vici::LootOption::PASS)
    end
  end

  class << LootNeedEventHandler.instance
    def execute(event)
      loot_id = event.loot_id
      loot    = Loot.find_by_id(loot_id)
      character_id    = event._character_id
      character       = Character.find_by_id(character_id)               

      LootInterface.roll(character, loot, Vici::LootOption::NEED)
    end
  end

  class << LootGreedEventHandler.instance
    def execute(event)
      loot_id = event.loot_id
      loot    = Loot.find_by_id(loot_id)
      character_id    = event._character_id
      character       = Character.find_by_id(character_id)               

      LootInterface.roll(character, loot, Vici::LootOption::GREED)     
    end
  end
end
