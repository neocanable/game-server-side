class MigrateScenePlayersToCharater < ActiveRecord::Migration
  def self.up
    %w{action_queue heap_instances scene_players units unit_path}.each do |table|
      drop_table table
    end
      
    add_column :characters, :is_dead, :integer, :default => 0
    add_column :characters, :dead_at, :integer, :default => 0
    
  end

  def self.down
    
    remove_column :characters, :is_dead
    remove_column :characters, :dead_at

    execuet <<-SQL
       CREATE TABLE `action_queue` (
        `id` int(11) NOT NULL auto_increment,
        `scene_id` int(11) NOT NULL,
        `unit_id` int(11) NOT NULL,
        `target_id` int(11) default NULL,
        `action_id` int(11) NOT NULL,
        `params` varchar(255) collate utf8_unicode_ci default NULL,
        PRIMARY KEY  (`id`),
        KEY `index_action_queue_on_scene_id` (`scene_id`),
        KEY `index_action_queue_on_unit_id` (`unit_id`)
      ) ENGINE=MEMORY DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci        
    SQL

    execuet <<-SQL
      CREATE TABLE `heap_instances` (
        `id` int(11) NOT NULL auto_increment,
        `zone_id` int(11) NOT NULL,
        `player_number` int(11) default NULL,
        `leave_at` datetime default NULL,
        PRIMARY KEY  (`id`),
        KEY `index_instances_on_zone_id` (`zone_id`)
      ) ENGINE=MEMORY DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci
    SQL

    execuet <<-SQL
      CREATE TABLE `scene_players` (
        `id` int(11) NOT NULL auto_increment,
        `account_id` int(11) NOT NULL,
        `profession` int(11) NOT NULL,
        `level` int(11) NOT NULL default '1',
        `health` int(11) NOT NULL,
        `power` int(11) NOT NULL,
        `is_dead` tinyint(1) NOT NULL default '0',
        `dead_at` int(11) default NULL,
        `static_zone_id` int(11) NOT NULL,
        `scene_id` int(11) default NULL,
        `x` int(11) default NULL,
        `y` int(11) default NULL,
        `name` varchar(255) collate utf8_unicode_ci NOT NULL,
        `appearance` int(11) NOT NULL,
        PRIMARY KEY  (`id`),
        KEY `index_scene_players_on_scene_id` (`scene_id`)
      ) ENGINE=MEMORY AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci
    SQL

    execuet <<-SQL
      CREATE TABLE `units` (
        `id` int(11) NOT NULL auto_increment,
        `character_id` int(11) default NULL,
        `name` varchar(255) collate utf8_unicode_ci default NULL,
        `appearance` int(11) default NULL,
        `profession` int(11) default NULL,
        `level` int(11) default NULL,
        `scene_id` int(11) NOT NULL,
        `zone_id` int(11) NOT NULL,
        `x` int(11) default NULL,
        `y` int(11) default NULL,
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
        `action_duration_tick` int(11) default NULL,
        `account_id` int(11) default NULL,
        `npc_id` int(11) default NULL,
        PRIMARY KEY  (`id`),
        KEY `index_units_on_scene_id` (`scene_id`)
      ) ENGINE=MEMORY DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci
    SQL

    execuet <<-SQL
      CREATE TABLE `unit_path` (
        `id` int(11) NOT NULL auto_increment,
        `unit_id` int(11) NOT NULL,
        `x` int(11) NOT NULL,
        `y` int(11) NOT NULL,
        `cost` int(11) NOT NULL,
        PRIMARY KEY  (`id`),
        KEY `index_unit_path_on_unit_id` (`unit_id`)
      ) ENGINE=MEMORY DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci
    SQL
  end
end
