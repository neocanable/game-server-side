#          id  4503
# description  玩家获得经验
#         api  player.player_xp_gain
#      params  xp_gained:int xp:int
#        call  vici
#     execute  client

module Vici
  class PlayerXpGainProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
