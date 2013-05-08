#          id  2204
# description  拖拽物品
#         api  container.drag_drop_item
#      params  source_container_index source_slot_index dest_container_index dest_slot_index
#        call  client
#     execute  vici

module Vici
  class DragDropItemEventHandler < ViciEventHandler
    def execute(event)
      source_container_index = event.source_container_index
      source_slot_index = event.source_slot_index
      dest_container_index = event.dest_container_index
      dest_slot_index = event.dest_slot_index
      raise "Overwrite me!"
    end
  end
end
