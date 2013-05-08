#          id  4309
# description  玩家金钱
#         api  player.player_money
#      params  money
#        call  vici
#     execute  client

module Vici
  class PlayerMoneyProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
