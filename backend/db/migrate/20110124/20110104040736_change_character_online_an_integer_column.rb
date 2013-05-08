class ChangeCharacterOnlineAnIntegerColumn < ActiveRecord::Migration
  def self.up
    change_column :characters, :online, :integer
  end

  def self.down
    change_column :characters, :online, :boolean
  end
end
