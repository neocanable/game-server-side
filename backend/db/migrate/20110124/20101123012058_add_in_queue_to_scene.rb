class AddInQueueToScene < ActiveRecord::Migration
  def self.up
    add_column :scenes, :in_queue, :boolean
  end

  def self.down
    remove_column :scenes, :in_queue
  end
end
