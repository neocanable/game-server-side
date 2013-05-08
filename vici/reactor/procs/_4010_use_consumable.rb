#          id  4010
# description  使用物品
#         api  activity.use_consumable
#      params  character_id static_item_id container_index slot_index
#        call  vici
#     execute  scene_worker

module Vici
  class UseConsumableProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
