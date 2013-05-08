class CreateBattleQueues < ActiveRecord::Migration
  def self.up
    remove_column :characters, :battleground_joined_at

    # 当一个战场有坑，找出所有排该战场和首先可用的玩家
    create_table :battle_queues do |t|
      t.integer :character_id     # 玩家角色
      t.boolean :first_avaliable  # 首先可用（第一个可用的战场）
      t.integer :battleground_id  # 指定战场
      t.integer :battleground_faction     # 阵营，NULL表示随机（未选择阵营）
      t.integer :battleground_joined_at   # 加入战场时间 （tick）
    end
  end

  def self.down
    drop_table :battle_queues
    add_column :characters, :battleground_joined_at, :integer   # 加入战场时间 （tick）
  end
end
