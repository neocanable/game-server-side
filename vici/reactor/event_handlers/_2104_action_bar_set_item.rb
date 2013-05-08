#          id  2104
# description  设置物品
#         api  action_bar.action_bar_set_item
#      params  slot_index item_id
#        call  client
#     execute  vici

module Vici
  class ActionBarSetItemEventHandler < ViciEventHandler
    def execute(event)
      slot_index = event.slot_index
      item_id = event.item_id
      raise "Overwrite me!"
    end
  end
end
