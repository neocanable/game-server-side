#          id  407
# description  公共场景创建失败
#         api  public_sence.public_scene_create_failed
#      params  scene_id
#        call  game_center
#     execute  pulse

module Pulse
  class PublicSceneCreateFailedEvent < PulseEvent
    include Singleton

    attr_accessor :scene_id

    def load(packet, connection = nil)
      @connection = connection
      @packet = packet
      data = packet.unpack
      @scene_id = data[1]
    end


    private
      def handler
        PublicSceneCreateFailedEventHandler.instance
      end
  end
end
