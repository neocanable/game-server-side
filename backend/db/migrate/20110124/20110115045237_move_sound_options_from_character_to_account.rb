class MoveSoundOptionsFromCharacterToAccount < ActiveRecord::Migration
  def self.up
    remove_column :characters, :mute
    remove_column :characters, :music_volume
    remove_column :characters, :sound_volume
    remove_column :characters, :field_of_vision

    add_column :accounts, :mute, :boolean
    add_column :accounts, :music_volume, :integer
    add_column :accounts, :sound_volume, :integer
    add_column :accounts, :field_of_vision, :integer
  end

  def self.down
    remove_column :accounts, :mute
    remove_column :accounts, :music_volume
    remove_column :accounts, :sound_volume
    remove_column :accounts, :field_of_vision

    add_column :characters, :mute, :boolean
    add_column :characters, :music_volume, :integer
    add_column :characters, :sound_volume, :integer
    add_column :characters, :field_of_vision, :integer
  end
end
