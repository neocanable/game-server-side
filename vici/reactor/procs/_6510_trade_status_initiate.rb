#          id  6510
# description  交易请求
#         api  trade.trade_status_initiate
#      params  target_character_id
#        call  vici
#     execute  client

module Vici
  class TradeStatusInitiateProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
