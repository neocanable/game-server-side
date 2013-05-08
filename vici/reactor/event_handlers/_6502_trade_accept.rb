#          id  6502
# description  确认交易
#         api  trade.trade_accept
#      params  
#        call  client
#     execute  vici

module Vici
  class TradeAcceptEventHandler < ViciEventHandler
    def execute(event)
      raise "Overwrite me!"
    end
  end
end
