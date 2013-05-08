class CreateTradeItems < ActiveRecord::Migration
  def self.up
    create_table :trade_items do |t|
      t.integer :trade_id
      t.integer :character_id
      t.integer :trade_slot_index
      t.integer :container_id
      t.integer :slot_index
      t.integer :static_item_id
      t.integer :stack
#      t.timestamps
    end
  end

  def self.down
    drop_table :trade_items
  end
end
