class AddCharacterInstance < ActiveRecord::Migration
  def self.up
    add_column :characters, :instance_id, :integer
  end

  def self.down
    remove_column :characters, :instance_id
  end
end
