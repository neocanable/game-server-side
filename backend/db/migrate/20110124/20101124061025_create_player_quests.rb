class CreatePlayerQuests < ActiveRecord::Migration
  def self.up
    create_table :player_quests do |t|
      t.integer :character_id
      t.integer :quest_id
      t.integer :objective1_progress
      t.integer :objective2_progress
      t.integer :objective3_progress
      t.integer :objective4_progress
#      t.timestamps
    end
    add_index :player_quests, :character_id
  end
  def self.down
    remove_index :player_quests, :character_id
    drop_table :player_quests
  end
end
