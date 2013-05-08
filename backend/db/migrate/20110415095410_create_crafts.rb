class CreateCrafts < ActiveRecord::Migration
  def self.up
    create_table :crafts do |t|
      t.integer :character_id
      t.integer :craft_branch_id
      t.integer :points, :default => 0
      t.integer :rank
    end

    add_column :recipes, :craft_branch_id, :integer
  end

  def self.down
    drop_table :crafts
    remove_column :recipes, :craft_branch_id
  end
end
