#          id  4402
# description  移除NPC尸体
#         api  scene_object.npc_corpse_remove
#      params  scene_id object_id
#        call  vici
#     execute  scene_worker

module Vici
  class NpcCorpseRemoveEvent < ViciEvent
    include Singleton

    attr_accessor :scene_id
    attr_accessor :object_id
    attr_accessor :_scene_id
    attr_accessor :_character_id


    def dump
      _event_id = 4402
      Packet.pack([_event_id, @scene_id, @object_id, @_scene_id, @_character_id])
    end

    private
      def handler
        NpcCorpseRemoveEventHandler.instance
      end
  end
end
