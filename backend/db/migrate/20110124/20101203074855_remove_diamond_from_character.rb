class RemoveDiamondFromCharacter < ActiveRecord::Migration
  def self.up
    remove_column :characters, :diamond
  end

  def self.down
    add_column :characters, :diamond, :integer, :null => false, :default => 0
  end
end
