#          id  6307
# description  购回
#         api  merchant.buyback
#      params  buyback_item_id
#        call  client
#     execute  vici

module Vici
  class BuybackEventHandler < ViciEventHandler
    def execute(event)
      buyback_item_id = event.buyback_item_id
      raise "Overwrite me!"
    end
  end
end
