class RemoveItemFromLoot < ActiveRecord::Migration
  def self.up
    remove_column :loots, :party_id
    remove_column :loots, :static_item_id
    remove_column :loots, :quantity
    remove_column :loots, :elapsed
    remove_column :loots, :scene_object_id
    remove_column :loots, :money

    add_column :loots, :scene_object_item_id, :integer, :null => false
    add_column :loots, :elapses_at, :integer, :default => nil
  end

  def self.down
    remove_column :loots, :scene_object_item_id
    remove_column :loots, :elapses_at

    add_column :loots, :party_id, :integer
    add_column :loots, :static_item_id, :integer
    add_column :loots, :quantity, :integer
    add_column :loots, :elapsed, :integer
    add_column :loots, :scene_object_id, :integer
    add_column :loots, :money, :integer
  end
end
