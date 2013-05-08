class CreateMalls < ActiveRecord::Migration
  def self.up
    create_table :malls do |t|
      t.integer :tab            # 类别
      t.integer :index          # 索引位置（决定商品的次序）
      t.integer :static_item_id # 物品
      t.integer :stack          # 堆叠数量
      t.integer :diamond_price  # 钻石价格
      t.integer :check_price    # 银票价格
#      t.timestamps
    end
  end

  def self.down
    drop_table :malls
  end
end
