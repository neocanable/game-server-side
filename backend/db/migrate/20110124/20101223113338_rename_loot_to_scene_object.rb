class RenameLootToSceneObject < ActiveRecord::Migration
  def self.up
    rename_column :open_loots, :loot_id, :scene_object_id
  end

  def self.down
    rename_column :open_loots, :scene_object_id, :loot_id
  end
end
