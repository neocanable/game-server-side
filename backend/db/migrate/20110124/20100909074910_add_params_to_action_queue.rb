class AddParamsToActionQueue < ActiveRecord::Migration
  def self.up
    add_column :action_queue, :params, :string
  end

  def self.down
    remove_column :action_queue, :params
  end
end
