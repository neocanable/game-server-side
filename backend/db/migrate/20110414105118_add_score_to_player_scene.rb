class AddScoreToPlayerScene < ActiveRecord::Migration
  def self.up
    add_column :player_scenes, :score1, :integer, :default => 0
    add_column :player_scenes, :score2, :integer, :default => 0
    add_column :player_scenes, :score3, :integer, :default => 0
    add_column :player_scenes, :score4, :integer, :default => 0
  end

  def self.down
    remove_column :player_scenes, :score1
    remove_column :player_scenes, :score2
    remove_column :player_scenes, :score3
    remove_column :player_scenes, :score4
  end
end
