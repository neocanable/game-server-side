class AddBattlegroundToCharacter < ActiveRecord::Migration
  def self.up
    add_column :characters, :battleground_id, :integer          # 战场
    add_column :characters, :battleground_faction, :integer     # 阵营，NULL表示随机（未选择阵营）
    add_column :characters, :battleground_joined_at, :integer   # 加入战场时间 （tick）
  end

  def self.down
    remove_column :characters, :battleground_id
    remove_column :characters, :battleground_faction
    remove_column :characters, :battleground_joined_at
  end
end
