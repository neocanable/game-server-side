#          id  4007
# description  使用物品
#         api  activity.use_item
#      params  item_id
#       notes  static_item_id
#        call  client
#     execute  vici

module Vici
  class UseItemEventHandler < ViciEventHandler
    def execute(event)
      item_id = event.item_id
      raise "Overwrite me!"
    end
  end
end
