#          id  4314
# description  玩家获得银票
#         api  player.player_voucher_gain
#      params  voucher_gained:int voucher
#        call  vici
#     execute  client

module Vici
  class PlayerVoucherGainProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
