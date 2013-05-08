#          id  6509
# description  物品变化
#         api  trade.trade_item_changed
#      params  character_id trade_slot_index static_item_id quantity
#        call  vici
#     execute  client

module Vici
  class TradeItemChangedProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
