#          id  6503
# description  取消确认
#         api  trade.trade_unaccept
#      params  
#        call  client
#     execute  vici

module Vici
  class TradeUnacceptEventHandler < ViciEventHandler
    def execute(event)
      raise "Overwrite me!"
    end
  end
end
