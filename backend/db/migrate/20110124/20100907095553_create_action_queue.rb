class CreateActionQueue < ActiveRecord::Migration
  def self.up
    execute <<-SQL
CREATE TABLE `action_queue` (
  `id` int(11) NOT NULL auto_increment PRIMARY KEY, 
  `scene_id` int(11) NOT NULL, 
  `unit_id` int(11) NOT NULL, 
  `target_id` int(11) default NULL, 
  `action_id` int(11) NOT NULL
) ENGINE=MEMORY
    SQL
    add_index(:action_queue, :scene_id)
    add_index(:action_queue, :unit_id)
  end

  def self.down
    remove_index(:action_queue, :scene_id)
    remove_index(:action_queue, :unit_id)
    drop_table :action_queue
  end
end
