#          id  6103
# description  拾取一件物品
#         api  loot.loot_one
#      params  scene_object_id object_item_id
#        call  client
#     execute  vici

module Vici
  class LootOneEventHandler < ViciEventHandler
    def execute(event)
      scene_object_id = event.scene_object_id
      object_item_id = event.object_item_id
      raise "Overwrite me!"
    end
  end
end
