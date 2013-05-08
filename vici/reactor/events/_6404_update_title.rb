#          id  6404
# description  更换称号
#         api  combat.update_title
#      params  character_id title_id
#        call  vici
#     execute  scene_worker

module Vici
  class UpdateTitleEvent < ViciEvent
    include Singleton

    attr_accessor :character_id
    attr_accessor :title_id
    attr_accessor :_scene_id
    attr_accessor :_character_id


    def dump
      _event_id = 6404
      Packet.pack([_event_id, @character_id, @title_id, @_scene_id, @_character_id])
    end

    private
      def handler
        UpdateTitleEventHandler.instance
      end
  end
end
