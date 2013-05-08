#          id  4312
# description  玩家获得钻石
#         api  player.player_diamond_gain
#      params  diamond_gained:int diamond
#        call  vici
#     execute  client

module Vici
  class PlayerDiamondGainProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
