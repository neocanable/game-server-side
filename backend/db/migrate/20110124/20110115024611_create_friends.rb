class CreateFriends < ActiveRecord::Migration
  def self.up
    create_table :friends do |t|
      t.integer :character_id
      t.string :note
      t.datetime :created_at
#      t.timestamps
    end
  end

  def self.down
    drop_table :friends
  end
end
