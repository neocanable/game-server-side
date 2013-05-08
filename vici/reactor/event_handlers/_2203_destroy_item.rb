#          id  2203
# description  删除物品
#         api  container.destroy_item
#      params  container_index:int slot_index:int
#        call  client
#     execute  vici

module Vici
  class DestroyItemEventHandler < ViciEventHandler
    def execute(event)
      container_index = event.container_index
      slot_index = event.slot_index
      raise "Overwrite me!"
    end
  end
end
