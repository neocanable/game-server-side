class AddSceneObjectToLootRoll < ActiveRecord::Migration
  def self.up
    add_column :loot_rolls, :scene_object_id, :integer, :default => nil
  end

  def self.down
    remove_column :loot_rolls, :scene_object_id
  end
end
