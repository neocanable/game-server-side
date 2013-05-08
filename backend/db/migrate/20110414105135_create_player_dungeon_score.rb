class CreatePlayerDungeonScore < ActiveRecord::Migration
  def self.up
    create_table :player_dungeon_scores do |t|
      t.integer  :character_id, :null => false
      t.integer  :dungeon_zone_id
      t.integer  :score
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :player_dungeon_scores
  end
end
