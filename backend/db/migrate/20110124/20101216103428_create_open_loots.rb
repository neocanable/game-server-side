class CreateOpenLoots < ActiveRecord::Migration
  def self.up
    create_table :open_loots do |t|
      t.integer :loot_id
      t.integer :character_id
#      t.timestamps
    end
  end

  def self.down
    drop_table :open_loots
  end
end
