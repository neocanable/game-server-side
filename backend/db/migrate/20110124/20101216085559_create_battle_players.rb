class CreateBattlePlayers < ActiveRecord::Migration
  def self.up
    create_table :battle_players do |t|
      t.integer :character_id           # 角色
      t.integer :battleground_id        # 战场
      t.integer :battleground_faction   # 阵营
      t.integer :kills                  # 击杀
      t.integer :deaths                 # 死亡
      t.integer :bouns_honor            # 获得的荣誉
#      t.timestamps
    end
    remove_column :characters, :battleground_id
    remove_column :characters, :battleground_faction
  end

  def self.down
    add_column :characters, :battleground_id, :integer
    add_column :characters, :battleground_faction, :integer
    drop_table :battle_players
  end
end
