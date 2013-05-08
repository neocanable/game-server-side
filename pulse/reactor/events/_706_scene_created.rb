#          id  706
# description  场景已创建
#         api  scene.scene_created
#      params  scene_id
#        call  game_center
#     execute  pulse

module Pulse
  class SceneCreatedEvent < PulseEvent
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
        SceneCreatedEventHandler.instance
      end
  end
end
