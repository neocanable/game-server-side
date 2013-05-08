#          id  1203
# description  保存游戏选项
#         api  options.save_options
#      params  show_newbie_tips:bool block_trades:bool block_party_invites:bool mute:bool music_volume:int sound_volume:int field_of_vision:int
#        call  client
#     execute  vici

module Vici
  class SaveOptionsEventHandler < ViciEventHandler
    def execute(event)
      show_newbie_tips = event.show_newbie_tips
      block_trades = event.block_trades
      block_party_invites = event.block_party_invites
      mute = event.mute
      music_volume = event.music_volume
      sound_volume = event.sound_volume
      field_of_vision = event.field_of_vision
      raise "Overwrite me!"
    end
  end
end
