class AddLockedToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :locked, :boolean, :default => false, :null => false
    remove_column :items, :in_trade
  end

  def self.down
    remove_column :items, :locked
    add_column :items, :in_trade, :boolean, :default => false, :null => false
  end
end
