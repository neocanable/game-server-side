class AddAppearanceToScenePlayers < ActiveRecord::Migration
  def self.up
    add_column :scene_players, :appearance, :integer, :null => false
  end

  def self.down
    remove_column :scene_players, :appearance
  end
end
