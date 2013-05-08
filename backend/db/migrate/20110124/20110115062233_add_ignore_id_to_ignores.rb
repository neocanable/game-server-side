class AddIgnoreIdToIgnores < ActiveRecord::Migration
  def self.up
    add_column :ignores, :ignore_id, :integer
  end

  def self.down
    remove_column :ignores, :ignore_id
  end
end
