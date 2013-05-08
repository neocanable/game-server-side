module StaticHelper

private

  def static_battleground(battle_id)
    Vici::Code.first(:BATTLEGROUND, 'id', battle_id)
  end

  def static_item(static_item_id)
    Vici::Code.first(:ITEM, 'id', static_item_id)
  end

  def static_npc(npc_id)
    Vici::Code.first(:NPC, 'id', npc_id)
  end
  
  def static_merchant(npc_id)
    raise InvalidNpcError if is_bad_npc?(npc_id)
    Vici::Code.find(:MERCHANT, 'npc_id', npc_id)
  end
  
  def static_merchant_item(npc_id, merchant_item_id)
    raise InvalidNpcError if is_bad_npc?(npc_id)
    #item = Vici::Code.find2(:MERCHANT, 'npc_id', 'item_id', npc_id, item_id)
    item = Vici::Code.first(:MERCHANT, 'id', merchant_item_id)
    raise ItemNotFoundError unless item
    item
  end

  def is_bad_npc?(npc_id)
    npc = static_npc(npc_id)
    raise InvalidNpcError unless npc 
    raise InvalidNpcError unless npc['faction']
    npc['faction'] == Vici::Faction::BAD
  end 

  def static_equipment(equipment_id)
    Vici::Code.first(:EQUIPMENT, 'id', equipment_id)
  end
  
  def static_zone(zone_id)
    Vici::Code.first(:ZONE, 'id', zone_id)
  end

  def static_location(location_id)
    Vici::Code.first(:LOCATION, "id", location_id)
  end
  
  def static_quest(quest_id)
    Vici::Code.first(:QUEST, 'id', quest_id)
  end
  
  def static_action(action_id)
    Vici::Code.first(:ACTION, 'id', action_id)
  end
  
  def static_spell(spell_id)
    Vici::Code.first(:SPELL, "id", spell_id)
  end
  
  def static_base_spell(spell_base_id)
    Vici::Code.first(:SPELL_BASE, "id", spell_base_id)   
  end

  def static_recipe(recipe_id)
    Vici::Code.first(:RECIPE, "id", recipe_id) 
  end

  def static_profession(profession_id)
    Vici::Code.first(:PROFESSION, "id", profession_id)
  end

  def max_stack(static_item_id)
    static_item(static_item_id)['max_stack']
  end
  
  def can_stack?(static_item_id)
    max_stack(static_item_id) > 1
  end

  def is_quest_item?(item)
    item["item_type"].to_i == Vici::ItemType::QUEST
  end

  def bag_index_for_item(static_item_id)
    type = static_item(static_item_id)['item_type']
    { 
      Vici::ItemType::EQUIPMENT => Vici::ContainerType::BAG_EQUIPMENT, 
      Vici::ItemType::MATERIAL => Vici::ContainerType::BAG_MATERIAL, 
      Vici::ItemType::CONSUMABLE => Vici::ContainerType::BAG_CONSUMABLE, 
      Vici::ItemType::QUEST => Vici::ContainerType::BAG_QUEST, 
      Vici::ItemType::PILL => Vici::ContainerType::BAG_MATERIAL, 
     }[type]
  end 

  def each_objective
    (1..Vici::QUEST_MAX_OBJECTIVES)
  end

  def each_reward
    (1..Vici::QUEST_MAX_REWARDS)
  end
  
end
