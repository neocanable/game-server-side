class AddPostureToCharacter < ActiveRecord::Migration
  def self.up
    add_column :characters, :posture, :integer
  end

  def self.down
    remove_column :characters, :posture
  end
end
