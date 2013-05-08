#          id  6303
# description  购买
#         api  merchant.buy_item
#      params  npc_id merchand_item_id
#        call  client
#     execute  vici

module Vici
  class BuyItemEventHandler < ViciEventHandler
    def execute(event)
      npc_id = event.npc_id
      merchand_item_id = event.merchand_item_id
      raise "Overwrite me!"
    end
  end
end
