class CreateSlots < ActiveRecord::Migration
  def self.up
    create_table :slots do |t|
      t.integer :container_id
      t.integer :slot_index
      t.integer :item_id
    end
  end

  def self.down
    drop_table :slots
  end
end
