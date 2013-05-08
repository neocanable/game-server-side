#          id  407
# description  公共场景创建失败
#         api  public_sence.public_scene_create_failed
#      params  scene_id
#        call  game_center
#     execute  pulse

module Pulse
  class PublicSceneCreateFailedEventHandler < PulseEventHandler
    def execute(event)
      scene_id = event.scene_id
      raise "Overwrite me!"
    end
  end
end
