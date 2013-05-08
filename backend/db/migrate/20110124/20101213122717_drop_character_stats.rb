class DropCharacterStats < ActiveRecord::Migration
  def self.up
    drop_table :character_stats
  end

  def self.down
    create_table :character_stats do |t|
      t.integer :character_id
      t.integer :max_health
      t.integer :max_power
    end
  end
end
