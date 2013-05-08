class CreateScenePlayer < ActiveRecord::Migration
  def self.up
    execute <<-SQL
CREATE TABLE `scene_players` (
  `id` int(11) NOT NULL auto_increment PRIMARY KEY, 
  `account_id` int(11) NOT NULL, 
  `profession` int(11) NOT NULL, 
  `level` int(11) NOT NULL default 1, 
  `health` int(11) NOT NULL, 
  `power` int(11) NOT NULL, 
  `is_dead` tinyint(1) NOT NULL default 0, 
  `dead_at` int(11) default NULL, 
  `static_zone_id` int(11) NOT NULL, 
  `scene_id` int(11) default NULL, 
  `x` int(11) default NULL, 
  `y` int(11) default NULL 
) ENGINE=MEMORY
    SQL
    add_index(:scene_players, :scene_id)
  end

  def self.down
    remove_index(:scene_players, :scene_id)
    drop_table :scene_players
  end
end

=begin
id      角色
account_id  帐号
profession  职业
level   等级
health  血量
power   能量
is_dead 是否死亡
dead_at 死亡时间（心跳服务器时钟，如果心跳服务器重置，重置玩家的死亡时间）
static_zone_id  区域
scene_id    场景
x       位置
y       位置
=end


=begin
is_online -> index!!!!!

CREATE TABLE `scene_players` (
  `id` int(11) NOT NULL auto_increment PRIMARY KEY, 
  `account_id` int(11) NOT NULL, 
  `name` varchar(255) NOT NULL, 
  `appearance` int(11) NOT NULL, 
  `profession` int(11) NOT NULL, 
  `is_online` tinyint(1) NOT NULL default 0, 
  `logout_at` datetime default NULL, 
  `level` int(11) NOT NULL default 1, 
  `xp` int(11) NOT NULL default 0, 
  `health` int(11) NOT NULL, 
  `power` int(11) NOT NULL, 
  `is_dead` tinyint(1) NOT NULL default 0, 
  `dead_at` int(11) default NULL, 
  `static_zone_id` int(11) NOT NULL, 
  `scene_id` int(11) NOT NULL, 
  `x` int(11) NOT NULL, 
  `y` int(11) NOT NULL, 
  `vigor` int(11) NOT NULL, 
  `dungeon_difficulty_level` int(11) NOT NULL, 
  `party_id` int(11) default NULL, 
  `unspent_spell_points` int(11) NOT NULL default 0, 
  `craft_branch` int(11) default NULL, 
  `craft_rank` int(11) NOT NULL, 
  `craft_points` int(11) NOT NULL, 
  `money` int(11) NOT NULL default 0, 
  `diamond` int(11) NOT NULL default 0 
) ENGINE=MEMORY
=end