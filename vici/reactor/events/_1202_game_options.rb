#          id  1202
# description  游戏选项
#         api  options.game_options
#      params  show_newbie_tips:bool block_trades:bool block_party_invites:bool mute:bool music_volume:int sound_volume:int field_of_vision:int
#        call  vici
#     execute  client

module Vici
  class GameOptionsEvent < ViciEvent
    include Singleton

    attr_accessor :show_newbie_tips
    attr_accessor :block_trades
    attr_accessor :block_party_invites
    attr_accessor :mute
    attr_accessor :music_volume
    attr_accessor :sound_volume
    attr_accessor :field_of_vision
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 1202
      Packet.pack([_event_id, @show_newbie_tips, @block_trades, @block_party_invites, @mute, @music_volume, @sound_volume, @field_of_vision, @_channel_id, @_account_id])
    end

    private
      def handler
        GameOptionsEventHandler.instance
      end
  end
end
