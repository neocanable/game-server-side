class Container < ActiveRecord::Base
  class << self
    
    def take_away_stack_items(character, static_item_id, quantity)
      items = character.get_items_by_static_item_id(static_item_id)
      amount = items.inject(0){|sum, item| sum += item.quantity }

      raise NotEnoughItemsError if quantity > amount
      changes = items.collect do |item|
        next if quantity == 0
        container = item.container
        if quantity >= item.quantity
          change = [container.container_type, item.slot_index, nil, 0]
          quantity = quantity - item.quantity
          item.destroy
        else
          change = [container.container_type, item.slot_index, item.static_item_id, item.quantity - quantity]
          item.quantity -= quantity 
          item.save!
          quantity = 0
        end
        change
      end
    end

    def take_away_items_by_index(character, container_index, slot_index, quantity = nil)
      container = Container.player_container(container_index, character.id)
      item      = container.get_item_by_slot_index(slot_index)
      raise InvalidSlotError unless item
      raise NotEnoughItemsError if quantity and item.quantity < quantity

      if quantity and item.quantity > quantity 
        item.quantity -= quantity
        item.save!
        changes = [[container_index, slot_index, item.static_item_id, item.quantity]]
      else
        changes = [[container_index, slot_index, nil, 0]]
        item.destroy
      end
      changes
    end

  end
end

