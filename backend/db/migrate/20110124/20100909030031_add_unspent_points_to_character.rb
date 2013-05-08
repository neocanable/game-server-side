class AddUnspentPointsToCharacter < ActiveRecord::Migration
  def self.up
    add_column :characters, :unspent_points, :integer
  end

  def self.down
    remove_column :characters, :unspent_points
  end
end
