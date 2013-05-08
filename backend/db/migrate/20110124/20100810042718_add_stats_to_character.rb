class AddStatsToCharacter < ActiveRecord::Migration
  def self.up
    add_column :characters, :move_point, :integer
    add_column :characters, :move_speed, :integer
    add_column :characters, :max_health, :integer
    add_column :characters, :max_power, :integer
    add_column :characters, :vit, :integer
    add_column :characters, :str, :integer
    add_column :characters, :agi, :integer
    add_column :characters, :int, :integer
    add_column :characters, :damage, :integer
    add_column :characters, :defense, :integer
    add_column :characters, :dodge, :integer
    add_column :characters, :hit, :integer
    add_column :characters, :crit, :integer
    add_column :characters, :attack_speed, :integer
    add_column :characters, :hit_recovery, :integer
    add_column :characters, :spell_damage, :integer
    add_column :characters, :spell_resist, :integer
    add_column :characters, :spell_hit, :integer
    add_column :characters, :spell_crit, :integer
    add_column :characters, :cast_rate, :integer
    add_column :characters, :target_id, :integer
  end

  def self.down
    remove_column :characters, :move_point
    remove_column :characters, :move_speed
    remove_column :characters, :max_health
    remove_column :characters, :max_power
    remove_column :characters, :vit
    remove_column :characters, :str
    remove_column :characters, :agi
    remove_column :characters, :int
    remove_column :characters, :damage
    remove_column :characters, :defense
    remove_column :characters, :dodge
    remove_column :characters, :hit
    remove_column :characters, :crit
    remove_column :characters, :attack_speed
    remove_column :characters, :hit_recovery
    remove_column :characters, :spell_damage
    remove_column :characters, :spell_resist
    remove_column :characters, :spell_hit
    remove_column :characters, :spell_crit
    remove_column :characters, :cast_rate
    remove_column :characters, :target_id
  end
end
