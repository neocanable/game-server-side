#          id  707
# description  场景创建失败
#         api  scene.scene_create_failed
#      params  scene_id
#        call  game_center
#     execute  pulse

module Pulse
  class SceneCreateFailedEvent < PulseEvent
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
        SceneCreateFailedEventHandler.instance
      end
  end
end
