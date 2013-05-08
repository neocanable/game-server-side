class RenameSceneObjectsColumns < ActiveRecord::Migration
  def self.up
    rename_column(:scene_objects, :onwer_character_id, :character_id)
    rename_column(:scene_objects, :onwer_party_id, :party_id)
  end

  def self.down
    rename_column(:scene_objects, :character_id, :onwer_character_id)
    rename_column(:scene_objects, :party_id, :onwer_party_id)
  end
end
