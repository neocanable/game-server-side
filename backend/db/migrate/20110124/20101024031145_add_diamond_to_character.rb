class AddDiamondToCharacter < ActiveRecord::Migration
  def self.up
    add_column :characters, :diamond, :integer
  end

  def self.down
    remove_column :characters, :diamond
  end
end
