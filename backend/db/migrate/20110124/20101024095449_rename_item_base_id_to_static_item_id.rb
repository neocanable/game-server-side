class RenameItemBaseIdToStaticItemId < ActiveRecord::Migration
  def self.up
    rename_column(:items, :item_base_id, :static_item_id)
    add_column :items, :stack, :integer
  end

  def self.down
    remove_column :items, :stack
    rename_column(:items, :static_item_id, :item_base_id)
  end
end
