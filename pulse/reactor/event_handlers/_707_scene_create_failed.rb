#          id  707
# description  场景创建失败
#         api  scene.scene_create_failed
#      params  scene_id
#        call  game_center
#     execute  pulse

module Pulse
  class SceneCreateFailedEventHandler < PulseEventHandler
    def execute(event)
      scene_id = event.scene_id
      raise "Overwrite me!"
    end
  end
end
