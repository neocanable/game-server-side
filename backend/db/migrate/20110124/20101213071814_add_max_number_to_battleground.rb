class AddMaxNumberToBattleground < ActiveRecord::Migration
  def self.up
    add_column :battlegrounds, :max_number, :integer   # 最大玩家数
  end

  def self.down
    remove_column :battlegrounds, :max_number
  end
end
