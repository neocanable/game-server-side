#          id  6506
# description  设置交易物品
#         api  trade.trade_set_item
#      params  trade_slot_index src_container_index src_slot_index quantity
#        call  client
#     execute  vici

module Vici
  class TradeSetItemEventHandler < ViciEventHandler
    def execute(event)
      trade_slot_index = event.trade_slot_index
      src_container_index = event.src_container_index
      src_slot_index = event.src_slot_index
      quantity = event.quantity
      raise "Overwrite me!"
    end
  end
end
