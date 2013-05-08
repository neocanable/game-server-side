class ChangeCharactersColumn < ActiveRecord::Migration
  def self.up
    rename_column :characters, :instance_id, :scene_id
    rename_column :characters, :zone, :static_zone_id

    %w{move_point move_speed max_health max_power vit str agi int damage defense dodge hit crit attack_speed hit_recovery spell_damage spell_resist spell_hit spell_crit
    cast_rate target_id posture end_x end_y end_o o}.each do |column|
      remove_column :characters, column
    end
  end

  def self.down
    %w{move_point move_speed max_health max_power vit str agi int damage defense dodge hit crit attack_speed hit_recovery spell_damage spell_resist spell_hit spell_crit
    cast_rate target_id posture end_x end_y end_o o}.each do |column|
      add_column :characters, column, :integer
    end
    rename_column :characters, :scene_id, :instance_id
    rename_column :characters, :static_zone_id, :zone
  end
end
