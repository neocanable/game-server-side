#          id  6302
# description  贩卖列表
#         api  merchant.sell_list
#      params  npc_id item[merchant_item_id static_item_id stack:int price:int honor_price:int]
#        call  vici
#     execute  client

module Vici
  class SellListProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
