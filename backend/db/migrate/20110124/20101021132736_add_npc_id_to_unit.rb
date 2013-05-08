class AddNpcIdToUnit < ActiveRecord::Migration
  def self.up
    add_column :units, :npc_id, :integer
  end

  def self.down
    remove_column :units, :npc_id
  end
end
