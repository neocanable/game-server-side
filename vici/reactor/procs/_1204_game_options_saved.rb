#          id  1204
# description  游戏选项已保存
#         api  options.game_options_saved
#      params  
#        call  vici
#     execute  client

module Vici
  class GameOptionsSavedProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
