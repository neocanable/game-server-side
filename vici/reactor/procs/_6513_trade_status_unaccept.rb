#          id  6513
# description  已经取消确认
#         api  trade.trade_status_unaccept
#      params  character_id
#        call  vici
#     execute  client

module Vici
  class TradeStatusUnacceptProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
