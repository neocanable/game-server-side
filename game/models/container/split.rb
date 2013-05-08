class Container < ActiveRecord::Base
  class << self

    def split(character, container_index, slot_index, dest_slot_index, amount)
      container   = player_container(container_index, character.id)
      item        = container.get_item_by_slot_index(slot_index)
      dest_item   = container.get_item_by_slot_index(dest_slot_index)
      static_item = static_item(item.static_item_id)
      max_stack   = static_item["max_stack"].to_i
      raise "SpiltAmountError" if item.quantity <= amount or amount <= 0
      raise InvalidSlotError if dest_item and dest_item.static_item_id != item.static_item_id
      amount = item.quantity if amount > item.quantity
      
      if dest_item
        raise InvalidSlotError if max_stack == dest_item.quantity
        amount = max_stack - dest_item.quantity if dest_item.quantity + amount > max_stack
        item.quantity      -= amount
        dest_item.quantity += amount
        item.save!
        dest_item.save!
      else
        # create_new
        dest_item = Item.new_item(container.character_id, item.static_item_id, amount, dest_slot_index, container)
        item.quantity -= amount
        item.save!
      end

      if item.quantity == 0
        item.destroy
        [[container_index, item.slot_index, nil, 0],[container_index, dest_item.slot_index, dest_item.static_item_id, dest_item.quantity]]
      else
        [[container_index, item.slot_index, item.static_item_id, item.quantity],[container_index, dest_item.slot_index, dest_item.static_item_id, dest_item.quantity]]
      end
    end

  end
end
