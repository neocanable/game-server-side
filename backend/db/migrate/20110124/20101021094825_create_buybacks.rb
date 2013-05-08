class CreateBuybacks < ActiveRecord::Migration
  def self.up
    create_table :buybacks do |t|
      t.integer :character_id
      t.integer :item_id
    end
  end

  def self.down
    drop_table :buybacks
  end
end
