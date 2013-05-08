#          id  401
# description  创建公共场景
#         api  public_sence.create_public_scene
#      params  scene_id zone_id
#        call  pulse
#     execute  scene_worker
#       proxy  scene_manager

module Pulse
  class CreatePublicSceneEvent < PulseEvent
    include Singleton

    attr_accessor :scene_id
    attr_accessor :zone_id


    def dump
      _event_id = 401
      Packet.pack([_event_id, @scene_id, @zone_id])
    end

    private
      def handler
        CreatePublicSceneEventHandler.instance
      end
  end
end
