class AddCraftToCharacter < ActiveRecord::Migration
  def self.up
    add_column :characters, :craft, :integer
    add_column :characters, :craft_rank, :integer
    add_column :characters, :craft_points, :integer
  end

  def self.down
    remove_column :characters, :craft
    remove_column :characters, :craft_rank
    remove_column :characters, :craft_points
  end
end
