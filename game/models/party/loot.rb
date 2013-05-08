class Party < ActiveRecord::Base
  def set_loot_threshold(loot_threshold)
    self.loot_threshold = loot_threshold
    save!
  end

  def set_loot_method(loot_method)
    self.loot_method = loot_method
    save!
  end

  def turn_character(character = nil)
    characters = character.nil? ? self.characters : same_scene_characters(character)
    loot_orders = characters.collect{|u| u.id }.sort
    index = self.loot_order.nil? ? 0 : self.loot_order%loot_orders.size
    to_character = Character.find_by_id(loot_orders[index])
    self.loot_order = self.loot_order.nil? ? 1 : self.loot_order += 1
    save!
    to_character
  end
end
