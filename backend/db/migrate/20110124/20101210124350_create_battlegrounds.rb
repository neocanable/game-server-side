class CreateBattlegrounds < ActiveRecord::Migration
  def self.up
    create_table :battlegrounds do |t|
      t.integer :battle_id    # 战场类型
      t.boolean :red_boss1    # 是否还存活
      t.boolean :red_boss2
      t.boolean :red_big_boss
      t.integer :red_kills    # 击杀敌方玩家数
      t.boolean :blue_boss1
      t.boolean :blue_boss2
      t.boolean :blue_big_boss
      t.integer :blue_kills
      t.integer :created_at   # 进入排队的时间（tick）
      t.integer :closes_at    # 战场应该在此时间关闭（tick）
      t.integer :began_at     # 战场开始时间（tick）
#      t.timestamps
    end
  end

  def self.down
    drop_table :battlegrounds
  end
end
