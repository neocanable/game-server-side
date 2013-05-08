#          id  6515
# description  交易完成
#         api  trade.trade_status_complete
#      params  
#        call  vici
#     execute  client

module Vici
  class TradeStatusCompleteProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
