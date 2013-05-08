module Vici
  module InterfaceHelper
    def durability_changed_event(character, item, container = nil)
      container ||= item.container  
      durability_changed(container.container_type, item.slot_index, item.static_item_id, item.durability, item.max_durability, character.account_id)
      inventory_slots_changed_event(character, [[container.container_type, item.slot_index]])  
    end

    def lock_item_event(character, item)
      container = item.container
      container_slot_locked(container.container_type, item.slot_index, character.account_id)
    end

    def unlock_item_event(character, item)
      container = item.container
      container_slot_unlocked(container.container_type, item.slot_index, character.account_id)
    end

  end
end  

