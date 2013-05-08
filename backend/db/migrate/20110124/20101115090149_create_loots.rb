class CreateLoots < ActiveRecord::Migration
  def self.up
    create_table :loots do |t|
      t.integer :party_id
      t.integer :static_item_id
      t.integer :stack
      t.integer :elapsed
#      t.timestamps
    end
  end

  def self.down
    drop_table :loots
  end
end
