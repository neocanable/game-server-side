class AddNumberToBattleground < ActiveRecord::Migration
  def self.up
    add_column :battlegrounds, :red_number, :integer    # 红方人数
    add_column :battlegrounds, :blue_number, :integer   # 蓝方人数
  end

  def self.down
    remove_column :battlegrounds, :red_number
    remove_column :battlegrounds, :blue_number
  end
end
