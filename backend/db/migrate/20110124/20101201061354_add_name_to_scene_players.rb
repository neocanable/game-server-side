class AddNameToScenePlayers < ActiveRecord::Migration
  def self.up
    add_column :scene_players, :name, :string, :null => false
  end

  def self.down
    remove_column :scene_players, :name
  end
end
