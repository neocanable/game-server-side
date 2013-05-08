module Vici
  # 获取背包内容
  class GetContainerEventHandler < ViciEventHandler
    def execute(event)
      container_index = event.container_index
      character_id    = event._character_id 
      account_id      = event._account_id
      character_container = ContainerInterface.get_container(container_index, character_id)
      items = character_container.items.collect do |item|
        #Container::Item.new(:slot_index => item.slot_index, :item_id => item.static_item_id, :amount => item.quantity)
        container_item = ContainerEvent::Item.new
        container_item.slot_index = item.slot_index
        container_item.item_id    = item.static_item_id
        container_item.amount     = item.quantity
        container_item
      end
      container(container_index, character_container.max_slot, items, account_id)
    end
  end

  # 分割物品
  class SplitItemEventHandler < ViciEventHandler
    def execute(event)
      container_index   = event.container_index
      source_slot_index = event.source_slot_index
      dest_slot_index   = event.dest_slot_index
      dest_amount       = event.dest_amount
      character_id      = event._character_id

      ContainerInterface.split(character_id, container_index, source_slot_index, dest_slot_index, dest_amount)
    end
  end

  # 删除物品
  class DestroyItemEventHandler < ViciEventHandler
    def execute(event)
      container_index = event.container_index
      slot_index      = event.slot_index
      character_id    = event._character_id
      account_id      = event._account_id
      
      ContainerInterface.destroy_item(character_id, container_index, slot_index)
    end
  end

  class DragDropItemEventHandler < ViciEventHandler
    def execute(event)
      source_container_index = event.source_container_index
      source_slot_index      = event.source_slot_index
      dest_container_index   = event.dest_container_index
      dest_slot_index        = event.dest_slot_index
      character_id           = event._character_id

      ContainerInterface.drag_drop(character_id, source_container_index, source_slot_index, dest_container_index, dest_slot_index)
    end
  end
end
