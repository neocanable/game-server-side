#          id  4311
# description  玩家钻石
#         api  player.player_diamond
#      params  diamond
#        call  vici
#     execute  client

module Vici
  class PlayerDiamondProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
