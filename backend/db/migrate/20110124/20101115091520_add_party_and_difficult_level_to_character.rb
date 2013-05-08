class AddPartyAndDifficultLevelToCharacter < ActiveRecord::Migration
  def self.up
    add_column :characters, :party_id, :integer
    add_column :characters, :difficult_level, :integer
  end

  def self.down
    remove_column :characters, :party_id
    remove_column :characters, :difficult_level
  end
end
