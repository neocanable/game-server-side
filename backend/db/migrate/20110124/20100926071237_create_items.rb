class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.integer :character_id
      t.integer :item_base_id

      t.integer :durability
      t.integer :max_durability

      t.integer :damage
      t.integer :spell_damage
      t.integer :defense
      t.integer :spell_defense

      t.integer :max_health
      t.integer :max_power

      t.integer :vitality
      t.integer :strength
      t.integer :dexterity
      t.integer :intellect

      t.integer :health_generation
      t.integer :power_generation

      t.integer :hit
      t.integer :dodge
      t.integer :crit

      t.datetime :expired
    end
  end

  def self.down
    drop_table :items
  end
end
