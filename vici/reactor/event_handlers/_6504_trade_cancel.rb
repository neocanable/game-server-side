#          id  6504
# description  取消交易
#         api  trade.trade_cancel
#      params  
#        call  client
#     execute  vici

module Vici
  class TradeCancelEventHandler < ViciEventHandler
    def execute(event)
      raise "Overwrite me!"
    end
  end
end
