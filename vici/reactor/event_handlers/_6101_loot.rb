#          id  6101
# description  拾取
#         api  loot.loot
#      params  scene_object_id
#        call  client
#     execute  vici

module Vici
  class LootEventHandler < ViciEventHandler
    def execute(event)
      scene_object_id = event.scene_object_id
      raise "Overwrite me!"
    end
  end
end
