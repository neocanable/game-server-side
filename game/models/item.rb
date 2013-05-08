require File.expand_path(File.dirname(__FILE__) + "/item/default_value")
require File.expand_path(File.dirname(__FILE__) + "/item/character")
require File.expand_path(File.dirname(__FILE__) + "/item/repair")
require File.expand_path(File.dirname(__FILE__) + "/item/equipment")
require File.expand_path(File.dirname(__FILE__) + "/item/lock_item")

class Item < ActiveRecord::Base
  belongs_to :container
  belongs_to :character

  class << self
    def create_stacking_item(static_item_id, character_id, amount = 1)
      raise "items stack is full" if amount > max_stack(static_item_id)
      create :character_id => character_id, :static_item_id => static_item_id, :quantity => amount
    end

    def advanced_professions(profession_id)
      result = []
      next_professions = Vici::Code.find(:PROFESSION, 'prev_profession', profession_id)
      next_professions.each do |profession|
        next_profession_id = profession['id']
        result << next_profession_id
        result += advanced_professions(next_profession_id)
      end 
      result.uniq
    end 

    # 物品的有效职业
    def item_valid_professions(static_item)
      valid_professions = []
      Vici::CharacterProfession.constants.each do |profession_name|
        valid_professions << Vici::CharacterProfession.const_get(profession_name.to_sym) if static_item[profession_name.downcase] == 1
      end 
      valid_professions.each do |profession_id|
        valid_professions += advanced_professions(profession_id)
      end 
      #    valid_professions.include?(@player.profession)
      valid_professions.uniq
    end 

    def is_valid_profession?(character, static_item)
      valid_professions = item_valid_professions(static_item)
      raise InvalidProfessionError unless valid_professions.include?(character.profession)
      true
    end

    def new_item(character_id, static_item_id, quantity, slot_index, container)
      Item.create :static_item_id => static_item_id, :quantity => quantity, :slot_index => slot_index, :container_id => container.id, :character_id => character_id
    end

    def expired_items
      find(:all, :conditions => ["expired<? AND expired IS NOT NULL", Time.now])
    end
    
  end

  def is_two_hand_weapon?
    two_hand_weapons = Vici::Code.find(:EQUIPMENT_TYPE, "two_hand", 1)
    two_hand_weapons.collect! {|equipment| equipment["equipment_type"] }
    two_hand_weapons.include?(static_equipment(self.static_item_id)['equipment_type'])
  end

  def is_off_hand_weapon?
    [ Vici::EquipmentType::SMALL_SHIELD,
      Vici::EquipmentType::MEDIUM_SHIELD,
      Vici::EquipmentType::LARGE_SHIELD ].include?(static_equipment(self.static_item_id)['equipment_type'])
  end


  def is_equipment?
    static_item(self.static_item_id)["item_type"] == Vici::ItemType::EQUIPMENT   
  end 

  def sell_price
    static_item(self.static_item_id)["sell_price"].to_i
  end

  def buyback_price
    (self.sell_price * 1.5).ceil
  end

    # 物品，对应的背包类型
  ITEM_BAG_INDEX = { 
    Vici::ItemType::EQUIPMENT => Vici::ContainerType::BAG_EQUIPMENT, 
    Vici::ItemType::MATERIAL => Vici::ContainerType::BAG_MATERIAL, 
    Vici::ItemType::CONSUMABLE => Vici::ContainerType::BAG_CONSUMABLE, 
    Vici::ItemType::QUEST => Vici::ContainerType::BAG_QUEST, 
    Vici::ItemType::PILL => Vici::ContainerType::BAG_MATERIAL, 
  }.freeze
  def self.bag_index_for_item(static_item_id)
    type = static_item(static_item_id)['item_type']
    ITEM_BAG_INDEX[type]
  end 

end

