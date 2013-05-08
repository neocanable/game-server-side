class AddDiamondToAccount < ActiveRecord::Migration
  def self.up
    add_column :accounts, :diamond, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :accounts, :diamond
  end
end
