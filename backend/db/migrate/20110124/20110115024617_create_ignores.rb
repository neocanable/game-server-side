class CreateIgnores < ActiveRecord::Migration
  def self.up
    create_table :ignores do |t|
      t.integer :character_id
      t.string :note
      t.datetime :created_at
#      t.timestamps
    end
  end

  def self.down
    drop_table :ignores
  end
end
