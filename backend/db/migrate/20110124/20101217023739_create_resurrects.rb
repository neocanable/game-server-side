class CreateResurrects < ActiveRecord::Migration
  def self.up
    create_table :resurrects do |t|
      t.integer :character_id   # 待复活的玩家
      t.integer :elapses_at     # 有效时间（TICK）
#      t.timestamps
    end
  end

  def self.down
    drop_table :resurrects
  end
end
