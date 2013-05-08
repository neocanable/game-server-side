#          id  4009
# description  使用背包物品
#         api  activity.use_container_item
#      params  container_index slot_index
#        call  client
#     execute  vici

module Vici
  class UseContainerItemEventHandler < ViciEventHandler
    def execute(event)
      container_index = event.container_index
      slot_index = event.slot_index
      raise "Overwrite me!"
    end
  end
end
