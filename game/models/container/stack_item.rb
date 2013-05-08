class Container < ActiveRecord::Base
  def put_stacking_items_into_container(static_item_id, amount = 1)
    raise NotEnoughSpaceError if item_capacity(static_item_id) < amount
    item_changes = []
    max = max_stack(static_item_id)
    if can_stack?(static_item_id)
      already_items = items.find(:all, :conditions => ["static_item_id=?", static_item_id])
      already_items.each do |item|
        next if item.quantity == max
        count = max - item.quantity
        if count >= amount
          item.quantity += amount
          amount = 0
        else
          item.quantity += (count)
          amount -= count
        end
        item.save!
        item_changes << changed_item(item)
        break if amount == 0
      end
    end
    # 构造新的物品，放入背包
    while amount > 0
      n = (amount > max) ? max : amount
      static_item = static_item(static_item_id)
      slot_index = self.free_slot_index
      item = Item.new_item(self.character_id, static_item_id, n, slot_index, self)
      item_changes << changed_item(item)
      amount -= n
    end
    item_changes
  end

  def take_away_stacking_items(static_item_id, amount = 1)
    item_changes = []    
    raise NotEnoughItemsError if self.item_amount(static_item_id) < amount
    already_items = items.find(:all, :conditions => ["static_item_id=?", static_item_id])
    already_items.each do |item|
      break if amount == 0
      if item.quantity <= amount
        amount = amount - item.quantity
        item_changes << destroyed_item(item)
        item.destroy
      else
        item.quantity = item.quantity - amount
        item.save!
        amount = 0
        item_changes << changed_item(item)
      end
    end
    item_changes
  end

  # 物品的数量
  def item_amount(static_item_id)
    items = self.items.find(:all, :conditions => ["static_item_id=?", static_item_id])
    items.inject(0) {|sum, item| sum += item.quantity }
  end

  private

    # 可以容纳的物品数量
    def item_capacity(static_item_id)
      return free_slots.size unless can_stack?(static_item_id)
      max = max_stack(static_item_id)
      #item_slots = slots_in_container(container, static_item_id)
      slot_count = items.count(:conditions => ["static_item_id=?", static_item_id])
      current_amount = item_amount(static_item_id)
      free_slots.size * max + (slot_count * max) - current_amount
    end

    def changed_item(item)
      [item.container.container_type, item.slot_index, item.static_item_id, item.quantity]
    end

    def destroyed_item(item)
      [item.container.container_type, item.slot_index, nil, 0]
    end


end  
