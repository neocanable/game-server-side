#          id  1204
# description  游戏选项已保存
#         api  options.game_options_saved
#      params  
#        call  vici
#     execute  client

module Vici
  class GameOptionsSavedEvent < ViciEvent
    include Singleton

    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 1204
      Packet.pack([_event_id, @_channel_id, @_account_id])
    end

    private
      def handler
        GameOptionsSavedEventHandler.instance
      end
  end
end
