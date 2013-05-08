class CreateBattlegroundObjectives < ActiveRecord::Migration
  def self.up
    create_table :battleground_objectives do |t|
      t.integer :battleground_id  # 战场类型
      t.integer :objective_id     # 已达成的战场目标
    end
    remove_column :battlegrounds, :red_boss1
    remove_column :battlegrounds, :red_boss2
    remove_column :battlegrounds, :red_big_boss
    remove_column :battlegrounds, :blue_boss1
    remove_column :battlegrounds, :blue_boss2
    remove_column :battlegrounds, :blue_big_boss
  end

  def self.down
    add_column :battlegrounds, :red_boss1, :boolean
    add_column :battlegrounds, :red_boss2, :boolean
    add_column :battlegrounds, :red_big_boss, :boolean
    add_column :battlegrounds, :blue_boss1, :boolean
    add_column :battlegrounds, :blue_boss2, :boolean
    add_column :battlegrounds, :blue_big_boss, :boolean
    drop_table :battleground_objectives
  end
end
