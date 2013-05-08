class CreateSpells < ActiveRecord::Migration
  def self.up
    create_table :spells do |t|
      t.integer :character_id
      t.integer :spell_id
      t.integer :rank
      #t.timestamps
    end
    add_index(:spells, :character_id)
  end

  def self.down
    remove_index(:spells, :character_id)
    drop_table :spells
  end
end
