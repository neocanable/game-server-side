class CreatePlayerScenes < ActiveRecord::Migration
  def self.up
    create_table :player_scenes do |t|
      t.integer :character_id
      t.integer :scene_id
#      t.timestamps
    end
  end

  def self.down
    drop_table :player_scenes
  end
end
