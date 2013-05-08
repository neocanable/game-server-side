class Container < ActiveRecord::Base
  def can_put?
    [ Vici::ContainerType::BAG_EQUIPMENT, 
      Vici::ContainerType::BAG_CONSUMABLE, 
      Vici::ContainerType::BAG_MATERIAL, 
      Vici::ContainerType::BAG_QUEST, 
      Vici::ContainerType::BANK, 
      Vici::ContainerType::MERCHANT, 
      Vici::ContainerType::BUYBACK, 
      Vici::ContainerType::INVENTORY ].include? self.container_type
  end

  def is_bag?
    [ Vici::ContainerType::BAG_EQUIPMENT, 
      Vici::ContainerType::BAG_CONSUMABLE, 
      Vici::ContainerType::BAG_MATERIAL, 
      Vici::ContainerType::BAG_QUEST ].include? self.container_type
  end

  def is_inventory?
    self.container_type == Vici::ContainerType::INVENTORY
  end

  def is_material?
    self.container_type == Vici::ContainerType::BAG_MATERIAL
  end

  def is_merchant?
    self.container_type == Vici::ContainerType::BUYBACK
  end

  def is_buyback?
    self.container_type == Vici::ContainerType::BUYBACK
  end

  def is_out_of_slot_bound?(slot_index)
    self.max_slot < slot_index
  end

  INVENTORY_SLOT_VS_EQUIPMENT_SLOT = { 
      Vici::InventorySlot::MAIN_HAND => Vici::EquipmentSlot::MAIN_HAND, 
      Vici::InventorySlot::OFF_HAND  => Vici::EquipmentSlot::OFF_HAND, 
      Vici::InventorySlot::HEAD      => Vici::EquipmentSlot::HEAD, 
      Vici::InventorySlot::BODY      => Vici::EquipmentSlot::BODY, 
      Vici::InventorySlot::FOOT      => Vici::EquipmentSlot::FOOT, 
      Vici::InventorySlot::HAND      => Vici::EquipmentSlot::HAND, 
      Vici::InventorySlot::NECK      => Vici::EquipmentSlot::NECK, 
      Vici::InventorySlot::FINGER1   => Vici::EquipmentSlot::FINGER, 
      Vici::InventorySlot::FINGER2   => Vici::EquipmentSlot::FINGER, 
      Vici::InventorySlot::TIARA     => Vici::EquipmentSlot::TIARA,
      Vici::InventorySlot::MASK      => Vici::EquipmentSlot::MASK,
      Vici::InventorySlot::BACK      => Vici::EquipmentSlot::BACK,
      Vici::InventorySlot::COAT      => Vici::EquipmentSlot::COAT
    }.freeze

  def self.can_equip?(equipment_slot_index, slot_index)
    INVENTORY_SLOT_VS_EQUIPMENT_SLOT[slot_index] == equipment_slot_index
  end 

end  
