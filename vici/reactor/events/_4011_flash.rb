#          id  4011
# description  场景内瞬移
#         api  activity.flash
#      params  character_id dest_x dest_y
#        call  vici
#     execute  scene_worker

module Vici
  class FlashEvent < ViciEvent
    include Singleton

    attr_accessor :character_id
    attr_accessor :dest_x
    attr_accessor :dest_y
    attr_accessor :_scene_id
    attr_accessor :_character_id


    def dump
      _event_id = 4011
      Packet.pack([_event_id, @character_id, @dest_x, @dest_y, @_scene_id, @_character_id])
    end

    private
      def handler
        FlashEventHandler.instance
      end
  end
end
