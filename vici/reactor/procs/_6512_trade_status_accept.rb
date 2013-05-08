#          id  6512
# description  交易已确认
#         api  trade.trade_status_accept
#      params  character_id
#        call  vici
#     execute  client

module Vici
  class TradeStatusAcceptProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
