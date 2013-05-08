#          id  6306
# description  购回列表
#         api  merchant.buyback_list
#      params  item[buyback_item_id static_item_id quantity price:int]
#        call  vici
#     execute  client

module Vici
  class BuybackListProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
