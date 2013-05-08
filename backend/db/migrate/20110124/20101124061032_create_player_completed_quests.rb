class CreatePlayerCompletedQuests < ActiveRecord::Migration
  def self.up
    create_table :player_completed_quests do |t|
      t.integer :character_id
      t.integer :quest_id
      t.timestamps
    end
    add_index :player_completed_quests, :character_id
  end

  def self.down
    remove_index :player_completed_quests, :character_id
    drop_table :player_completed_quests
  end
end
