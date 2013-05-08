#          id  6104
# description  拾取所有物品
#         api  loot.loot_all
#      params  scene_object_id
#        call  client
#     execute  vici

module Vici
  class LootAllEventHandler < ViciEventHandler
    def execute(event)
      scene_object_id = event.scene_object_id
      raise "Overwrite me!"
    end
  end
end
