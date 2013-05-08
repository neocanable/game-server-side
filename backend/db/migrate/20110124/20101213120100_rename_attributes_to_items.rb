class RenameAttributesToItems < ActiveRecord::Migration
  def self.up
    # obsolete attributes
    remove_column :items, :damage
    remove_column :items, :spell_damage
    remove_column :items, :defense
    remove_column :items, :spell_defense
    remove_column :items, :max_health
    remove_column :items, :max_power
    remove_column :items, :vitality
    remove_column :items, :strength
    remove_column :items, :dexterity
    remove_column :items, :intellect
    remove_column :items, :health_generation
    remove_column :items, :power_generation
    remove_column :items, :hit
    remove_column :items, :crit
    remove_column :items, :dodge

    # new attributes
    add_column :items, :strength, :integer
    add_column :items, :intellect, :integer
    add_column :items, :vitality, :integer

    add_column :items, :hit_rating, :integer
    add_column :items, :crit_rating, :integer
    add_column :items, :dodge_rating, :integer

    add_column :items, :min_attack, :integer
    add_column :items, :max_attack, :integer
    add_column :items, :damage, :integer
    add_column :items, :defense, :integer

    add_column :items, :spell_min_attack, :integer
    add_column :items, :spell_max_attack, :integer
    add_column :items, :spell_damage, :integer
    add_column :items, :spell_defense, :integer

    add_column :items, :max_health, :integer
    add_column :items, :health_regeneration, :integer
    add_column :items, :max_power, :integer
    add_column :items, :power_regeneration, :integer

    add_column :items, :attack_speed, :integer
    add_column :items, :move_speed, :integer
  end

  def self.down1
    # obsolete attributes
    add_column :items, :damage, :integer
    add_column :items, :spell_damage, :integer
    add_column :items, :defense, :integer
    add_column :items, :spell_defense, :integer
    add_column :items, :max_health, :integer
    add_column :items, :max_power, :integer
    add_column :items, :vitality, :integer
    add_column :items, :strength, :integer
    add_column :items, :dexterity, :integer
    add_column :items, :intellect, :integer
    add_column :items, :health_generation, :integer
    add_column :items, :power_generation, :integer
    add_column :items, :hit, :integer
    add_column :items, :crit, :integer
    add_column :items, :dodge, :integer

    # new attributes
    remove_column :items, :strength
    remove_column :items, :intellect
    remove_column :items, :vitality
    remove_column :items, :hit_rating
    remove_column :items, :crit_rating
    remove_column :items, :dodge_rating
    remove_column :items, :min_attack
    remove_column :items, :max_attack
    remove_column :items, :damage
    remove_column :items, :defense
    remove_column :items, :spell_min_attack
    remove_column :items, :spell_max_attack
    remove_column :items, :spell_damage
    remove_column :items, :spell_defense
    remove_column :items, :max_health
    remove_column :items, :health_regeneration
    remove_column :items, :max_power
    remove_column :items, :power_regeneration
    remove_column :items, :attack_speed
    remove_column :items, :move_speed
  end
end




