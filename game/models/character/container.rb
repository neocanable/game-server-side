class Character < ActiveRecord::Base
  def buyback_container
    containers.first(:conditions => {:container_type => Vici::ContainerType::BUYBACK})
  end

  def armors
    container = Container.player_container(Vici::ContainerType::INVENTORY, self.id)
    armor_slots = [Vici::InventorySlot::HEAD,      
    Vici::InventorySlot::BODY,      
    Vici::InventorySlot::FOOT,      
    Vici::InventorySlot::HAND,      
    Vici::InventorySlot::NECK,      
    Vici::InventorySlot::FINGER1,   
    Vici::InventorySlot::FINGER2,   
    Vici::InventorySlot::TIARA,     
    Vici::InventorySlot::MASK,     
    Vici::InventorySlot::BACK,      
    Vici::InventorySlot::OFF_HAND,
    Vici::InventorySlot::COAT]
    items = Item.find(:all, :conditions => ["container_id=? AND slot_index IN (?)", container.id, armor_slots])
  end

  def weapon
    container = Container.player_container(Vici::ContainerType::INVENTORY, self.id)
    Item.first(:conditions => ["container_id=? AND slot_index=?", container.id, Vici::InventorySlot::MAIN_HAND])
  end
end
