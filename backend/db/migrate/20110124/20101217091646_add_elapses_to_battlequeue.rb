class AddElapsesToBattlequeue < ActiveRecord::Migration
  def self.up
    add_column :battle_queues, :elapses_at, :integer, :default => nil   # 进场超时时间（TICK）
  end

  def self.down
    remove_column :battle_queues, :elapses_at
  end
end
