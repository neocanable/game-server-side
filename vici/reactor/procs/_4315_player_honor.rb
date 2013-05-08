#          id  4315
# description  玩家荣誉
#         api  player.player_honor
#      params  honor
#        call  vici
#     execute  client

module Vici
  class PlayerHonorProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
