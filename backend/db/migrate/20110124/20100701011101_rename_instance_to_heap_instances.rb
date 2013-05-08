class RenameInstanceToHeapInstances < ActiveRecord::Migration
  def self.up
    rename_table :instances, :heap_instances
    
  end

  def self.down
    rename_table :heap_instances, :instances
  end
end
