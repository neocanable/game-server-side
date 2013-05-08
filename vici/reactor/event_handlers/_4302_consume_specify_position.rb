#          id  4302
# description  消耗物品，指定背包位置
#         api  item.consume_specify_position
#      params  character_id static_item_id container_index slot_index
#       notes  指定位置的物品
#        call  scene_worker
#     execute  vici

module Vici
  class ConsumeSpecifyPositionEventHandler < ViciEventHandler
    def execute(event)
      character_id = event.character_id
      static_item_id = event.static_item_id
      container_index = event.container_index
      slot_index = event.slot_index
      raise "Overwrite me!"
    end
  end
end
