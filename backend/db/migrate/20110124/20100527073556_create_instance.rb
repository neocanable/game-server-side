class CreateInstance < ActiveRecord::Migration
  def self.up
    execute("CREATE TABLE `instances` (`id` int(11) DEFAULT NULL auto_increment PRIMARY KEY, `zone_id` int(11) NOT NULL) ENGINE=MEMORY")
    add_index(:instances, :zone_id)
  end

  def self.down
    remove_index(:instances, :zone_id)
    drop_table :instances
  end
end
