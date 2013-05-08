#          id  6505
# description  设置交易金币
#         api  trade.trade_set_money
#      params  money
#        call  client
#     execute  vici

module Vici
  class TradeSetMoneyEventHandler < ViciEventHandler
    def execute(event)
      money = event.money
      raise "Overwrite me!"
    end
  end
end
