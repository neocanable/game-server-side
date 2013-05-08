#          id  6514
# description  交易失败
#         api  trade.trade_status_failed
#      params  
#        call  vici
#     execute  client

module Vici
  class TradeStatusFailedProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
