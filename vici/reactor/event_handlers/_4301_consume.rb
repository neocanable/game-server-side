#          id  4301
# description  消耗物品
#         api  item.consume
#      params  character_id static_item_id
#        call  scene_worker
#     execute  vici

module Vici
  class ConsumeEventHandler < ViciEventHandler
    def execute(event)
      character_id = event.character_id
      static_item_id = event.static_item_id
      raise "Overwrite me!"
    end
  end
end
