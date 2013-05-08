class AddOpenAtToScene < ActiveRecord::Migration
  def self.up
    # 副本的创建时间（排队成功的时间）
    # 时间戳
    add_column :scenes, :open_at, :integer
  end

  def self.down
    remove_column :scenes, :open_at
  end
end
