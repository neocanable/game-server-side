#          id  1203
# description  保存游戏选项
#         api  options.save_options
#      params  show_newbie_tips:bool block_trades:bool block_party_invites:bool mute:bool music_volume:int sound_volume:int field_of_vision:int
#        call  client
#     execute  vici

module Vici
  class SaveOptionsEvent < ViciEvent
    include Singleton

    attr_accessor :show_newbie_tips
    attr_accessor :block_trades
    attr_accessor :block_party_invites
    attr_accessor :mute
    attr_accessor :music_volume
    attr_accessor :sound_volume
    attr_accessor :field_of_vision
    attr_accessor :_tick
    attr_accessor :_role_id
    attr_accessor :_zone_id
    attr_accessor :_scene_id
    attr_accessor :_account_id
    attr_accessor :_character_id
    attr_accessor :_party_id
    attr_accessor :_guild_id

    def load(packet, connection = nil)
      @connection = connection
      @packet = packet
      data = packet.unpack
      @show_newbie_tips = data[1]
      @block_trades = data[2]
      @block_party_invites = data[3]
      @mute = data[4]
      @music_volume = data[5]
      @sound_volume = data[6]
      @field_of_vision = data[7]
      @_tick = data[8]
      @_role_id = data[9]
      @_zone_id = data[10]
      @_scene_id = data[11]
      @_account_id = data[12]
      @_character_id = data[13]
      @_party_id = data[14]
      @_guild_id = data[15]
    end


    private
      def handler
        SaveOptionsEventHandler.instance
      end
  end
end
