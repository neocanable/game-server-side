#          id  6804
# description  赠送
#         api  mall.mall_give
#      params  mall_item_id quantity currency:int target_character_name
#        call  client
#     execute  vici

module Vici
  class MallGiveEventHandler < ViciEventHandler
    def execute(event)
      mall_item_id = event.mall_item_id
      quantity = event.quantity
      currency = event.currency
      target_character_name = event.target_character_name
      raise "Overwrite me!"
    end
  end
end
