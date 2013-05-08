#          id  4313
# description  玩家银票
#         api  player.player_voucher
#      params  voucher
#        call  vici
#     execute  client

module Vici
  class PlayerVoucherProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
