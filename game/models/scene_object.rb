class SceneObject < ActiveRecord::Base
  has_many :scene_object_items
  has_many :loots
  has_many :open_loots

  def time_over?
    self.elapses_at  
  end

  def open_loot!(character)
    #raise "CanNotOpenLootError" unless self.belongs_to?(character)
    OpenLoot.create :scene_object_id => self.id, :character_id => character.id unless character.open_loot(self)
    self.close_elapses_at!
  end

  def fill_in(item_id, amount = 1)
    scene_object_items.create(:static_item_id => item_id, :quantity => amount)
  end

  def object_offset_id
    Vici::OBJECT_ID_OFFSET + self.id
  end

  def set_elapses_at_after_close!
    self.elapses_at = Time.now + Vici::SCENE_OBJECT_ELAPSE_TIME_AFTER_LOOT
    save!
  end

  def belongs_to?(character)
    (character.id == self.character_id) or (character.party_id == self.party_id)
  end

  def unit_id
    self.id + 20000000
  end

  def close_elapses_at!
    self.elapses_at = 0
    save!
  end

  def can_loot_list(character)
    raise "CanNotOpenLootError" unless can_open_loot?(character)
    party = character.party
    return self.scene_object_items if party.nil?
    self.scene_object_items.collect{|scene_object_item|
      if self.can_loot_item?(character, scene_object_item)
        scene_object_item
      else
        nil
      end
    }.compact
  end

  def can_loot_item?(character, scene_object_item)

    party = character.party
    static_item = static_item(scene_object_item.static_item_id)    
    if static_item["item_type"] == Vici::ItemType::QUEST and character.need_item_count(scene_object_item.static_item_id) > 0
      true
    elsif self.character_id == character.id and self.party_id == character.party_id and party.loot_method == Vici::LootMethod::GROUP_LOOT and static_item["item_type"] != Vici::ItemType::QUEST
      true
    elsif self.party_id == character.party_id and party.loot_method == Vici::LootMethod::FREE_FOR_ALL and static_item["item_type"] != Vici::ItemType::QUEST
      true
    else
      false
    end
  end


  def can_open_loot?(character)
    return false if self.party_id != character.party_id and self.character_id != character.id
    true
  end
end
