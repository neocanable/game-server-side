class CreateScene < ActiveRecord::Migration
  def self.up
    execute("CREATE TABLE `scenes` (`id` int(11) NOT NULL auto_increment PRIMARY KEY, `zone_id` int(11) NOT NULL, `player_number` int(11) NOT NULL, `leave_at` datetime default NULL) ENGINE=MEMORY")
    add_index(:scenes, :zone_id)
  end

  def self.down
    remove_index(:scenes, :zone_id)
    drop_table :scenes
  end
end
