#          id  1202
# description  游戏选项
#         api  options.game_options
#      params  show_newbie_tips:bool block_trades:bool block_party_invites:bool mute:bool music_volume:int sound_volume:int field_of_vision:int
#        call  vici
#     execute  client

module Vici
  class GameOptionsProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
