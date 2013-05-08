class RenameMapToZone < ActiveRecord::Migration
  def self.up
    rename_column(:characters, :map, :zone)
  end

  def self.down
    rename_column(:characters, :zone, :map)
  end
end
