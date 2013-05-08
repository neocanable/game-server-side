class Character < ActiveRecord::Base
  has_many :items

  def item_count(static_item_id)
    get_items_by_static_item_id(static_item_id).inject(0){|sum, item| sum += (item.quantity.nil? ? 0 : item.quantity) }
  end

  def get_items_by_static_item_id(static_item_id)
    items.find(:all, :conditions => ["static_item_id=?", static_item_id])
  end

end
