#          id  4401
# description  NPC死亡出现尸体
#         api  scene_object.npc_corpse_info
#      params  object_id unit_id static_npc_id x y owner_character_id owner_party_id
#        call  vici
#     execute  client

module Vici
  class NpcCorpseInfoEvent < ViciEvent
    include Singleton

    attr_accessor :object_id
    attr_accessor :unit_id
    attr_accessor :static_npc_id
    attr_accessor :x
    attr_accessor :y
    attr_accessor :owner_character_id
    attr_accessor :owner_party_id
    attr_accessor :_channel_id
    attr_accessor :_scene_id


    def dump
      _event_id = 4401
      Packet.pack([_event_id, @object_id, @unit_id, @static_npc_id, @x, @y, @owner_character_id, @owner_party_id, @_channel_id, @_scene_id])
    end

    private
      def handler
        NpcCorpseInfoEventHandler.instance
      end
  end
end
