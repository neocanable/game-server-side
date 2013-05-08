class CreateSceneNpc < ActiveRecord::Migration
  def self.up
    execute <<-SQL
CREATE TABLE `scene_npcs` (
  `id` int(11) NOT NULL auto_increment PRIMARY KEY, 
  `static_npc_id` int(11) NOT NULL, 
  `scene_id` int(11) NOT NULL, 
  `x` int(11) NOT NULL, 
  `y` int(11) NOT NULL, 
  `is_dead` tinyint(1) NOT NULL, 
  `dead_at` int(11) default NULL 
) ENGINE=MEMORY
    SQL
    add_index(:scene_npcs, :scene_id)
  end

  def self.down
    remove_index(:scene_npcs, :scene_id)
    drop_table :scene_npcs
  end
end

