class CreateSceneObjects < ActiveRecord::Migration
  def self.up
    create_table :scene_objects do |t|
      t.integer :scene_id
      t.integer :created_at   # 创建时间（tick）
      t.integer :elapses_at   # 消失时间（tick）
#      t.timestamps
    end
  end

  def self.down
    drop_table :scene_objects
  end
end
