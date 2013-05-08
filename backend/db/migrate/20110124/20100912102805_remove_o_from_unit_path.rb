class RemoveOFromUnitPath < ActiveRecord::Migration
  def self.up
    remove_column :unit_path, :o
    remove_column :units, :o
  end

  def self.down
    add_column :units, :o, :integer
    add_column :unit_path, :o, :integer
  end
end
