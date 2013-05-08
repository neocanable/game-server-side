class AddHonorToCharacter < ActiveRecord::Migration
  def self.up
    add_column :characters, :honor, :integer, :default => 0, :null => false   # 荣誉值
  end

  def self.down
    remove_column :characters, :honor
  end
end
