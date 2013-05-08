#          id  6511
# description  交易已取消
#         api  trade.trade_status_cancel
#      params  
#        call  vici
#     execute  client

module Vici
  class TradeStatusCancelProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
