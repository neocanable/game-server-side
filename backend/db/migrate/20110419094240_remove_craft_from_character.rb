class RemoveCraftFromCharacter < ActiveRecord::Migration
  def self.up
    remove_column :characters, :craft
    remove_column :characters, :craft_rank
    remove_column :characters, :craft_points
  end

  def self.down
    add_column :characters, :craft, :integer
    add_column :characters, :craft_points, :integer
    add_column :characters, :craft_rank, :integer
  end
end
