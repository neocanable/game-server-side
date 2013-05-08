#          id  6106
# description  关闭拾取包
#         api  loot.loot_release
#      params  scene_object_id
#        call  client
#     execute  vici

module Vici
  class LootReleaseEventHandler < ViciEventHandler
    def execute(event)
      scene_object_id = event.scene_object_id
      raise "Overwrite me!"
    end
  end
end
