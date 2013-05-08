class CreateCooldown < ActiveRecord::Migration
  def self.up
    execute("CREATE TABLE `cooldowns` (`id` int(11) NOT NULL auto_increment PRIMARY KEY, `character_id` int(11) NOT NULL, `cooldown_id` int(11) NOT NULL, `elapses_at` DATETIME NOT NULL)")
  end

  def self.down
    drop_table :cooldowns
  end
end
