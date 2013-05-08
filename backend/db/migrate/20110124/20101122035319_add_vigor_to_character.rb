class AddVigorToCharacter < ActiveRecord::Migration
  def self.up
    add_column :characters, :vigor, :integer
  end

  def self.down
    remove_column :characters, :vigor
  end
end
