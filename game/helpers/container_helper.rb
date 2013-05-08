module Vici
  module InterfaceHelper

    def container_slot_changed_event(items, character)
      changed_items = items.collect do |arr|
        item = ContainerSlotChangedEvent::Item.new
        item.container_index = arr[0]
        item.slot_index      = arr[1]
        item.item_id         = arr[2]
        item.amount          = arr[3]
        item
      end
      inventory_slots_changed_event(character, items)
      container_slot_changed(changed_items, character.account_id)
    end

    def inventory_slots_changed_event(character, items)
      inventorys = items.collect {|arr|
        next unless arr[0] == Vici::ContainerType::INVENTORY
        inventory_slot = UpdateInventoryEvent::Inventory.new
        inventory_slot.slot_index = arr[1]
        inventory_slot
      }.compact
      update_inventory(character.id, inventorys, character.scene_id, character.id) if inventorys.size > 0
    end

    def item_expired_event(item)
      arr = [[item.container.container_type, item.slot_index, nil, 0]]
      container_slot_changed_event(arr, item.character)
    end

    # 玩家获得物品
    def character_gets_items_event(static_item_id, amount, character)
      changed_items = Container.give_items_to_assign_player(static_item_id, amount, character.id)
      character_item_quest_event(static_item_id, amount, character)
      container_slot_changed_event(changed_items, character)  
    end

    def take_away_stacking_items_event(character, static_item_id, quantity)
      item_changes = Container.take_away_stack_items(character, static_item_id, quantity)

      container_slot_changed_event(item_changes.compact, character)
      check_item_quest_to_destroy(static_item_id, -quantity, character)
    end

    def take_away_stacking_items_with_index(character, container_index, slot_index, quantity = nil)
      container = Container.player_container(container_index, character.id)
      item      = container.get_item_by_slot_index(slot_index)
      item_changes = Container.take_away_items_by_index(character, container_index, slot_index, quantity)
      amount = quantity.nil? ? -item.quantity : -quantity  
      check_item_quest_to_destroy(item.static_item_id, amount, character)
      container_slot_changed_event(item_changes, character)
    end

    def container_max_slot_changed_event(character, container)
      container_max_slots_changed(container.container_type, container.max_slot, character.account_id)
    end

  end
end  

