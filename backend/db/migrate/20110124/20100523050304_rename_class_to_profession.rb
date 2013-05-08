class RenameClassToProfession < ActiveRecord::Migration
  def self.up
    rename_column(:characters, :class, :profession)
  end

  def self.down
    rename_column(:characters, :profession, :class)
  end
end
