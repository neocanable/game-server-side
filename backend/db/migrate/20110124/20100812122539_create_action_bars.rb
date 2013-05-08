class CreateActionBars < ActiveRecord::Migration
  def self.up
    create_table :action_bars do |t|
      t.integer :character_id
      t.integer :slot_id
      t.integer :spell_id
      t.integer :item_id
    end
  end

  def self.down
    drop_table :action_bars
  end
end
