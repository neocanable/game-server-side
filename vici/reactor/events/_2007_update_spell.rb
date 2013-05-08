#          id  2007
# description  玩家技能改变
#         api  combat.update_spell
#      params  character_id
#       notes  learn_spell?
#        call  vici
#     execute  scene_worker

module Vici
  class UpdateSpellEvent < ViciEvent
    include Singleton

    attr_accessor :character_id
    attr_accessor :_scene_id
    attr_accessor :_character_id


    def dump
      _event_id = 2007
      Packet.pack([_event_id, @character_id, @_scene_id, @_character_id])
    end

    private
      def handler
        UpdateSpellEventHandler.instance
      end
  end
end
