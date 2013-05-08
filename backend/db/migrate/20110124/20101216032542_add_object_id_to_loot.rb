class AddObjectIdToLoot < ActiveRecord::Migration
  def self.up
    add_column :loots, :scene_object_id, :integer   # 尸体、宝箱
    add_column :loots, :money, :integer   # 掉落 - 钱
    rename_column :loots, :stack, :quantity
  end

  def self.down
    remove_column :loots, :scene_object_id
    remove_column :loots, :money
    rename_column :loots, :quantity, :stack
  end
end
