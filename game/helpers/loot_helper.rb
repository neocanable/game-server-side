module Vici
  module InterfaceHelper
    def loot_item_removed_event(scene_object, item, character)
      removed_items = []
      removed_item = LootItemRemovedEvent::Item.new
      removed_item.object_item_id = item.id
      removed_items << removed_item


      scene_object.open_loots.each do |open_loot|
        character = open_loot.character
        loot_item_removed(scene_object.id, removed_items, character.account_id)
      end

      #loot_item_removed(scene_object_id, items, _party_id = nil, _channel_id = 7)
      item.destroy  
      scene_object.reload  
      if scene_object.scene_object_items.count == 0
        npc_corpse_remove(character.scene_id, scene_object.unit_id, character.scene_id, character.id)
      end
    end

    def loot_list_event(scene_object, character)
      items = scene_object.can_loot_list(character).collect do |scene_object_item|
        item = LootListEvent::Item.new
        item.object_item_id = scene_object_item.id
        item.static_item_id = scene_object_item.static_item_id
        item.quantity       = scene_object_item.quantity
        item
      end
      loot_list(scene_object.unit_id, items, character.account_id)
    end

    def loot_roll_event(character, loot, static_item_id, quantity)
      party = character.party
      party.same_scene_characters(character).each do |member|
        loot_roll(loot.id, static_item_id, quantity, member.account_id)
      end
    end

    def roll_event(character, loot, roll, option)
      party = character.party    
      if roll.option_id == Vici::LootOption::NEED
        party.same_scene_characters(character).each do |member|  
          loot_need_roll(loot.id, character.id, roll.number, member.account_id)
        end
      elsif roll.option_id == Vici::LootOption::GREED
        party.same_scene_characters(character).each do |member|  
          loot_greed_roll(loot.id, character.id, roll.number, member.account_id)
        end
      elsif roll.option_id == Vici::LootOption::PASS
        party.same_scene_characters(character).each do |member|  
          loot_pass(loot.id, character.id, member.account_id)
        end
      else
      end
    end

    # 查找event
    def loot_event_table(loot_option)
      [Vici::LootOption::NEED,
       Vici::LootOption::GREED, Vici::LootOption::PASS]
    end

  end
end  

