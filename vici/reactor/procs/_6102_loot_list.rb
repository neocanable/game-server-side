#          id  6102
# description  拾取包中的物品
#         api  loot.loot_list
#      params  scene_object_id item[object_item_id static_item_id quantity]
#        call  vici
#     execute  client

module Vici
  class LootListProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
