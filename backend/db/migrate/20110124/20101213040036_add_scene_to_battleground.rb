class AddSceneToBattleground < ActiveRecord::Migration
  def self.up
    add_column :battlegrounds, :scene_id, :integer          # 战场副本
  end

  def self.down
    remove_column :battlegrounds, :scene_id
  end
end
