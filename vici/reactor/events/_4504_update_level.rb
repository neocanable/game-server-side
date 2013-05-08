#          id  4504
# description  玩家已升级
#         api  combat.update_level
#      params  character_id new_level
#        call  vici
#     execute  scene_worker

module Vici
  class UpdateLevelEvent < ViciEvent
    include Singleton

    attr_accessor :character_id
    attr_accessor :new_level
    attr_accessor :_scene_id
    attr_accessor :_character_id


    def dump
      _event_id = 4504
      Packet.pack([_event_id, @character_id, @new_level, @_scene_id, @_character_id])
    end

    private
      def handler
        UpdateLevelEventHandler.instance
      end
  end
end
