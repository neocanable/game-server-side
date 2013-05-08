#          id  6507
# description  取走交易物品
#         api  trade.trade_clear_item
#      params  trade_slot_index
#        call  client
#     execute  vici

module Vici
  class TradeClearItemEventHandler < ViciEventHandler
    def execute(event)
      trade_slot_index = event.trade_slot_index
      raise "Overwrite me!"
    end
  end
end
