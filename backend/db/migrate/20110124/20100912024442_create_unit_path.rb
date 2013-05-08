class CreateUnitPath < ActiveRecord::Migration
  def self.up
    execute <<-SQL
CREATE TABLE `unit_path` (
  `id` int(11) NOT NULL auto_increment PRIMARY KEY, 
  `unit_id` int(11) NOT NULL, 
  `x` int(11) NOT NULL, 
  `y` int(11) NOT NULL, 
  `o` int(11) NOT NULL, 
  `cost` int(11) NOT NULL
) ENGINE=MEMORY
    SQL
    add_index(:unit_path, :unit_id)
  end

  def self.down
    remove_index(:unit_path, :unit_id)
    drop_table :unit_path
  end
end
