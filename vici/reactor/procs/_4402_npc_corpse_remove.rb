#          id  4402
# description  移除NPC尸体
#         api  scene_object.npc_corpse_remove
#      params  scene_id object_id
#        call  vici
#     execute  scene_worker

module Vici
  class NpcCorpseRemoveProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
