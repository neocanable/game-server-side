class Container < ActiveRecord::Base
  class << self
    def drag_drop(character, container_index, slot_index, dest_container_index, dest_slot_index)
      container      = player_container(container_index, character.id) 
      dest_container = player_container(dest_container_index, character.id)
      item           = container.get_item_by_slot_index(slot_index)
      static_item    = static_item(item.static_item_id)
      
      raise InvalidContainerError unless can_put_item_in?(character, item, dest_container, dest_slot_index)

      dest_item = dest_container.get_item_by_slot_index(dest_slot_index)
      #   如果，物品static_item_id相同，并且是可堆叠的物品
      max_stack = static_item['max_stack']
      
      if dest_item and dest_item.static_item_id == item.static_item_id and max_stack > 1 #and dest_item.quantity < max_stack
        if dest_item.quantity < max_stack
          move_stacking_item(container, item, dest_container, dest_item, max_stack)
        else
          []
        end
      else
        changes = []
        if dest_container_index == Vici::ContainerType::INVENTORY #and dest_slot_index == Vici::InventorySlot::MAIN_HAND
          # 装备双手武器，替换单手武器+盾牌时，需要检查装备包是否满
          main_hand_item = dest_container.inventory_slot(Vici::InventorySlot::MAIN_HAND)
          off_hand_item = dest_container.inventory_slot(Vici::InventorySlot::OFF_HAND)
          bag_container = player_container(Vici::ContainerType::BAG_EQUIPMENT, character.id)
          if item.is_two_hand_weapon? and off_hand_item  # 装备双手武器，换下单手武器
            changes << [off_hand_item.container.container_type, off_hand_item.slot_index, nil, 0]
            changes += bag_container.add_item(off_hand_item)
          elsif item.is_off_hand_weapon? and main_hand_item and main_hand_item.is_two_hand_weapon?
            # 装备副手武器，换下双手武器
            changes << [main_hand_item.container.container_type, main_hand_item.slot_index, nil, 0]
            changes += bag_container.add_item(main_hand_item)
          end
        end
        # 交换
        changes + swap_slots(container, slot_index, dest_container, dest_slot_index)
      end
    end

    def swap_slots(container, slot_index, dest_container, dest_slot_index)
      #slot.item_id, dest_slot.item_id = dest_slot.item_id, slot.item_id
      changes = []
      item = container.get_item_by_slot_index(slot_index)
      dest_item = dest_container.get_item_by_slot_index(dest_slot_index)

      if item and dest_item
        can_put_item_in?(dest_container.character, dest_item, container, slot_index)
        item.slot_index = dest_slot_index
        item.container_id = dest_container.id
        dest_item.slot_index = slot_index
        dest_item.container_id = container.id
        item.save!
        dest_item.save!
        item.reload
        dest_item.reload
        changes << [dest_item.container.container_type, dest_item.slot_index, dest_item.static_item_id, dest_item.quantity]
        changes << [item.container.container_type, item.slot_index, item.static_item_id, item.quantity]
      elsif item and dest_item.nil?
         item.slot_index = dest_slot_index
         item.container_id = dest_container.id         
         item.save!
         item.reload
         changes << [container.container_type, slot_index, nil, 0]
         changes << [dest_container.container_type, item.slot_index, item.static_item_id, item.quantity]
      else
      end
      changes
    end


    private

      def can_put_item_in?(character, item, container, dest_slot_index)
        static_item    = static_item(item.static_item_id)
        static_item_id = item.static_item_id
        raise InvalidContainerError unless container.can_put?

        if container.is_bag?
          raise InvalidContainerError unless Item.bag_index_for_item(static_item_id) == container.container_type
        end

        if container.is_inventory?
          static_equipment = static_equipment(static_item_id)
          raise InvalidSlotError unless can_equip?(static_equipment["slot"], dest_slot_index)
          raise LevelTooLowError if character.level < static_item["level_required"].to_i
          Item.is_valid_profession?(character, static_item)
        end
        raise InvalidSlotError if container.max_slot < dest_slot_index + 1
        true
      end

      def move_stacking_item(container, item, dest_container, dest_item, max_stack)
        changes = []
        amount = item.quantity
        amount = (max_stack - dest_item.quantity) if (dest_item.quantity + amount) > max_stack
        return changes if amount == 0
        dest_item.quantity += amount
        dest_item.save!
        item.quantity -= amount

        changes << [dest_item.container.container_type, dest_item.slot_index, dest_item.static_item_id, dest_item.quantity]
        if item.quantity == 0
          changes << [container.container_type, item.slot_index, nil, 0]
          item.destroy
        else
          item.save!
          changes << [container.container_type, item.slot_index, item.static_item_id, item.quantity]
        end
        changes
        #[container_index slot_index item_id amount]
      end



  end

  def add_item(item, dest_slot_index = nil)
    dest_slot_index ||= free_slot_index
    # TODO 检查背包是否满了
    item.slot_index = dest_slot_index
    item.container_id = self.id
    item.save!
    [[self.container_type, item.slot_index, item.static_item_id, item.quantity]]
  end
end  
