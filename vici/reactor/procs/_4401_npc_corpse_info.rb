#          id  4401
# description  NPC死亡出现尸体
#         api  scene_object.npc_corpse_info
#      params  object_id unit_id static_npc_id x y owner_character_id owner_party_id
#        call  vici
#     execute  client

module Vici
  class NpcCorpseInfoProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
