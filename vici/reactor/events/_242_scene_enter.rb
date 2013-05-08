#          id  242
# description  进入场景
#         api  scene.scene_enter
#      params  character_id zone_id x y
#        call  vici
#     execute  game_center

module Vici
  class SceneEnterEvent < ViciEvent
    include Singleton

    attr_accessor :character_id
    attr_accessor :zone_id
    attr_accessor :x
    attr_accessor :y


    def dump
      _event_id = 242
      Packet.pack([_event_id, @character_id, @zone_id, @x, @y])
    end

    private
      def handler
        SceneEnterEventHandler.instance
      end
  end
end
