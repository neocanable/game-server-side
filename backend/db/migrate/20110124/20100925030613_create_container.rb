class CreateContainer < ActiveRecord::Migration
  def self.up
    create_table :containers do |t|
      t.integer :character_id
      t.integer :container_type
      t.integer :max_slot
    end
  end

  def self.down
    drop_table :containers
  end
end
