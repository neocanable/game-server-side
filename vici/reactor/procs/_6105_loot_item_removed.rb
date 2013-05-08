#          id  6105
# description  拾取包中的物品被拿走
#         api  loot.loot_item_removed
#      params  scene_object_id item[object_item_id]
#        call  vici
#     execute  client

module Vici
  class LootItemRemovedProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
