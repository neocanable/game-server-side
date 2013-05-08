#          id  4502
# description  玩家经验
#         api  player.player_xp
#      params  xp:int
#        call  vici
#     execute  client

module Vici
  class PlayerXpProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
