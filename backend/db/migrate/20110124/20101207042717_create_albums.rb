class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.integer :character_id
      t.integer :card_num
      t.datetime :gain_time
#      t.timestamps
    end
  end

  def self.down
    drop_table :albums
  end
end



