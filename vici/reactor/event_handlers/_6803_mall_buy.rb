#          id  6803
# description  购买
#         api  mall.mall_buy
#      params  mall_item_id quantity currency:int
#        call  client
#     execute  vici

module Vici
  class MallBuyEventHandler < ViciEventHandler
    def execute(event)
      mall_item_id = event.mall_item_id
      quantity = event.quantity
      currency = event.currency
      raise "Overwrite me!"
    end
  end
end
