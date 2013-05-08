class CreateLootRolls < ActiveRecord::Migration
  def self.up
    create_table :loot_rolls do |t|
      t.integer :loot_id
      t.integer :character_id
      t.integer :option_id
      t.integer :number
#      t.timestamps
    end
  end

  def self.down
    drop_table :loot_rolls
  end
end
