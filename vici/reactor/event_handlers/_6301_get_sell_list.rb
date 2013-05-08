#          id  6301
# description  取得贩卖列表
#         api  merchant.get_sell_list
#      params  npc_id
#        call  client
#     execute  vici

module Vici
  class GetSellListEventHandler < ViciEventHandler
    def execute(event)
      npc_id = event.npc_id
      raise "Overwrite me!"
    end
  end
end
