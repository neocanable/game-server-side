class CreateParties < ActiveRecord::Migration
  def self.up
    create_table :parties do |t|
      t.integer :leader_id
      t.integer :loot_method
      t.integer :loot_threshold
      t.integer :number_of_members
#      t.timestamps
    end
  end

  def self.down
    drop_table :parties
  end
end
