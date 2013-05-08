class Item < ActiveRecord::Base
  def consume(amount = 1)
    if item.quantity > amount
      item.quantity -= amount
      item.save!
      changes = [item.container.container_index, item.slot_index, item.quantity]
    else
      changes = [item.container.container_index, item.slot_index, nil, 0]   
      item.destroy
    end   
    changes
  end
end
