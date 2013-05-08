class CreateCharacters < ActiveRecord::Migration
  def self.up
    create_table :characters do |t|
      t.integer :account
      t.string :name
      t.integer :appearance
      t.integer :class
      t.integer :level
      t.integer :xp
      t.integer :money
      t.integer :map
      t.integer :x
      t.integer :y
      t.integer :o
      t.boolean :online
      t.timestamp :logout_time
      t.integer :health
      t.integer :power
#      t.timestamps
    end
  end

  def self.down
    drop_table :characters
  end
end
