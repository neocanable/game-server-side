#          id  2205
# description  拆分物品
#         api  container.split_item
#      params  container_index source_slot_index dest_slot_index dest_amount:int
#        call  client
#     execute  vici

module Vici
  class SplitItemEventHandler < ViciEventHandler
    def execute(event)
      container_index = event.container_index
      source_slot_index = event.source_slot_index
      dest_slot_index = event.dest_slot_index
      dest_amount = event.dest_amount
      raise "Overwrite me!"
    end
  end
end
