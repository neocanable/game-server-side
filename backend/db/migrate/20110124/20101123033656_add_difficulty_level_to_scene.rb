class AddDifficultyLevelToScene < ActiveRecord::Migration
  def self.up
    add_column :scenes, :difficulty_level, :integer
  end

  def self.down
    remove_column :scenes, :difficulty_level
  end
end
