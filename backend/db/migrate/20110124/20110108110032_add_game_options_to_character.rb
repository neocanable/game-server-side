class AddGameOptionsToCharacter < ActiveRecord::Migration
  def self.up
    add_column :characters, :show_newbie_tips, :boolean       # 新手帮助
    add_column :characters, :block_trades, :boolean           # 拒绝交易
    add_column :characters, :block_party_invites, :boolean    # 拒绝组队
    add_column :characters, :mute, :boolean                   # 静音
    add_column :characters, :music_volume, :integer           # 背景音乐
    add_column :characters, :sound_volume, :integer           # 游戏音效
    add_column :characters, :field_of_vision, :integer        # 视野（显示半径，或周围玩家的最大数，队友、好友、公会成员始终显示）
  end

  def self.down
    remove_column :characters, :show_newbie_tips
    remove_column :characters, :block_trades
    remove_column :characters, :block_party_invites
    remove_column :characters, :mute
    remove_column :characters, :music_volume
    remove_column :characters, :sound_volume
    remove_column :characters, :field_of_vision
  end
end
