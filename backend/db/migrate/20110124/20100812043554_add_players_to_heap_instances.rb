class AddPlayersToHeapInstances < ActiveRecord::Migration
  def self.up
    add_column :heap_instances, :player_number, :integer
    add_column :heap_instances, :leave_at, :datetime
  end

  def self.down
    remove_column :heap_instances, :player_number
    remove_column :heap_instances, :leave_at
  end
end
