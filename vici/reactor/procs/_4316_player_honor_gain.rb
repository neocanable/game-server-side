#          id  4316
# description  玩家获得荣誉
#         api  player.player_honor_gain
#      params  honor_gained:int honor
#        call  vici
#     execute  client

module Vici
  class PlayerHonorGainProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
