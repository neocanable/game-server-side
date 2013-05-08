class CreatePaths < ActiveRecord::Migration
  def self.up
    create_table :paths do |t|
      t.integer :character_id
      t.integer :x      # 坐标
      t.integer :y      # 坐标
      t.integer :o      # 角色朝向
      t.integer :cost   # 从前一个格子移动到这个格子，需要消耗的行动力
    end
  end

  def self.down
    drop_table :paths
  end
end
