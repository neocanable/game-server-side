class CreateCharacterStats < ActiveRecord::Migration
  def self.up
    create_table :character_stats do |t|
      t.integer :character_id
      t.integer :max_health
      t.integer :max_power
    end
  end

  def self.down
    drop_table :character_stats
  end
end
