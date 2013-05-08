#          id  6508
# description  金币变化
#         api  trade.trade_money_changed
#      params  character_id money
#        call  vici
#     execute  client

module Vici
  class TradeMoneyChangedProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
