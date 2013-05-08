class CreateSceneObjectItems < ActiveRecord::Migration
  def self.up
    create_table :scene_object_items do |t|
      t.integer :scene_object_id
      t.integer :static_item_id
      t.integer :quantity
#      t.timestamps
    end
  end

  def self.down
    drop_table :scene_object_items
  end
end
