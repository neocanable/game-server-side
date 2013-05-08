#          id  4310
# description  玩家获得金钱
#         api  player.player_money_gain
#      params  money_gained:int money
#        call  vici
#     execute  client

module Vici
  class PlayerMoneyGainProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
