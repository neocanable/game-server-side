#          id  6304
# description  卖
#         api  merchant.sell_item
#      params  container_type:int slot_index
#        call  client
#     execute  vici

module Vici
  class SellItemEventHandler < ViciEventHandler
    def execute(event)
      container_type = event.container_type
      slot_index = event.slot_index
      raise "Overwrite me!"
    end
  end
end
