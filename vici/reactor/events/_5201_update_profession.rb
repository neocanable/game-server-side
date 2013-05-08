#          id  5201
# description  转职
#         api  combat.update_profession
#      params  character_id new_profession_id
#        call  vici
#     execute  scene_worker

module Vici
  class UpdateProfessionEvent < ViciEvent
    include Singleton

    attr_accessor :character_id
    attr_accessor :new_profession_id
    attr_accessor :_scene_id
    attr_accessor :_character_id


    def dump
      _event_id = 5201
      Packet.pack([_event_id, @character_id, @new_profession_id, @_scene_id, @_character_id])
    end

    private
      def handler
        UpdateProfessionEventHandler.instance
      end
  end
end
