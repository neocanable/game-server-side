class AddLootOrderToParty < ActiveRecord::Migration
  def self.up
    add_column :parties, :loot_order, :integer
  end
  def self.down
    remove_column :parties, :loot_order
  end
end
