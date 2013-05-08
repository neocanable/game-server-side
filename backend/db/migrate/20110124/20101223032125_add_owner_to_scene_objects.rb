class AddOwnerToSceneObjects < ActiveRecord::Migration
  def self.up
    add_column :scene_objects, :x, :integer, :null => false
    add_column :scene_objects, :y, :integer, :null => false
    add_column :scene_objects, :onwer_character_id, :integer, :default => nil
    add_column :scene_objects, :onwer_party_id, :integer, :default => nil
  end

  def self.down
    remove_column :scene_objects, :x
    remove_column :scene_objects, :y
    remove_column :scene_objects, :onwer_character_id
    remove_column :scene_objects, :onwer_party_id
  end
end
