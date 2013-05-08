#          id  406
# description  公共场景已创建
#         api  public_sence.public_scene_created
#      params  scene_id
#        call  game_center
#     execute  pulse

module Pulse
  class PublicSceneCreatedEvent < PulseEvent
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
        PublicSceneCreatedEventHandler.instance
      end
  end
end
