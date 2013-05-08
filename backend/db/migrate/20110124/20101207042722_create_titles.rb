class CreateTitles < ActiveRecord::Migration
  def self.up
    create_table :titles do |t|
      t.integer :character_id
      t.integer :title_id
#      t.timestamps
    end
  end

  def self.down
    drop_table :titles
  end
end
