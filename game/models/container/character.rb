class Container < ActiveRecord::Base
  class << self
    def create_character_default_containers(character_id)
      # TODO 背包、仓库解锁，等收费道具的实现
      eq = create :container_type => Vici::ContainerType::BAG_EQUIPMENT, :character_id => character_id, :max_slot => Vici::BAG_DEFAULT_SLOTS
      bc = create :container_type => Vici::ContainerType::BAG_CONSUMABLE, :character_id => character_id, :max_slot => Vici::BAG_DEFAULT_SLOTS
      create :container_type => Vici::ContainerType::BAG_MATERIAL, :character_id => character_id, :max_slot => Vici::BAG_DEFAULT_SLOTS
      create :container_type => Vici::ContainerType::BAG_QUEST, :character_id => character_id, :max_slot => Vici::BAG_DEFAULT_SLOTS
      create :container_type => Vici::ContainerType::BUYBACK, :character_id => character_id, :max_slot => Vici::BUYBACK_MAX_SLOTS
      create :container_type => Vici::ContainerType::BANK, :character_id => character_id, :max_slot => Vici::BANK_DEFAULT_SLOTS
      create :container_type => Vici::ContainerType::INVENTORY, :character_id => character_id, :max_slot => Vici::INVENTORY_MAX_SLOTS


      [800013, 800014, 800001, 800002, 800003, 800004, 800015, 800015, 800017, 54, 55, 56].each do |num|
        eq.put_stacking_items_into_container(num, 1)
      end
      bc.put_stacking_items_into_container(13000,22)
    end
  end

end  
