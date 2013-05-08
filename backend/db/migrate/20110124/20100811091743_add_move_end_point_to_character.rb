class AddMoveEndPointToCharacter < ActiveRecord::Migration
  def self.up
    add_column :characters, :end_x, :integer
    add_column :characters, :end_y, :integer
    add_column :characters, :end_o, :integer
  end

  def self.down
    remove_column :characters, :end_x
    remove_column :characters, :end_y
    remove_column :characters, :end_o
  end
end
