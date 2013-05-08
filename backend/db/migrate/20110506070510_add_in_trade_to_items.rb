class AddInTradeToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :in_trade, :boolean, :default => false, :null => false
  end

  def self.down
    remove_column :items, :in_trade
  end
end
