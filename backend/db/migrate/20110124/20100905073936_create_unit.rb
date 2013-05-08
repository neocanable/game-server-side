class CreateUnit < ActiveRecord::Migration
  def self.up
    execute <<-SQL
CREATE TABLE `units` (
  `id` int(11) NOT NULL auto_increment PRIMARY KEY, 
  `character_id` int(11) default NULL, 

  `name` varchar(255) default NULL, 
  `appearance` int(11) default NULL, 
  `profession` int(11) default NULL, 
  `level` int(11) default NULL, 

  `scene_id` int(11) NOT NULL, 
  `zone_id` int(11) NOT NULL, 
  `x` int(11) default NULL, 
  `y` int(11) default NULL, 
  `o` int(11) default NULL, 

  `vit` int(11) default NULL,
  `str` int(11) default NULL,
  `dex` int(11) default NULL,
  `int` int(11) default NULL,

  `hit` int(11) default NULL,
  `dodge` int(11) default NULL,
  `crit` int(11) default NULL,

  `melee_damage` int(11) default NULL,
  `range_damage` int(11) default NULL,
  `defence` int(11) default NULL,
  `damage_reduced` int(11) default NULL,

  `spell_min_damage` int(11) default NULL,
  `spell_max_damage` int(11) default NULL,
  `spell_defence` int(11) default NULL,
  `spell_damage_reduced` int(11) default NULL,

  `attack_speed` int(11) default NULL,
  `cast_rate` int(11) default NULL,
  `hit_recovery` int(11) default NULL,
  `move_speed` int(11) default NULL,

  `max_health` int(11) default NULL,
  `max_power` int(11) default NULL,

  `health_generation` int(11) default NULL,
  `power_generation` int(11) default NULL,

  `health` int(11) default NULL,
  `power` int(11) default NULL,

  `move_point` int(11) default NULL,

  `posture_id` int(11) default NULL, 

  `target_id` int(11) default NULL,

  `current_action_id` int(11) default NULL, 
  `action_start_tick` int(11) default NULL, 
  `action_end_tick` int(11) default NULL, 
  `action_duration_tick` int(11) default NULL
) ENGINE=MEMORY
    SQL
    #add_index(:units, :character_id)
    add_index(:units, :scene_id)
  end


  def self.down
    #remove_index(:units, :character_id)
    remove_index(:units, :scene_id)
    drop_table :units
  end
end


