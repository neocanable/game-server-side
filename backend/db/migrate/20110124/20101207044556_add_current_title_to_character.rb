class AddCurrentTitleToCharacter < ActiveRecord::Migration
  def self.up
    add_column :characters, :current_title, :integer, :default => nil
  end

  def self.down
    remove_column :characters, :current_title
  end
end
