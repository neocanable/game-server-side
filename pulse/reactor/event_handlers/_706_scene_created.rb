#          id  706
# description  场景已创建
#         api  scene.scene_created
#      params  scene_id
#        call  game_center
#     execute  pulse

module Pulse
  class SceneCreatedEventHandler < PulseEventHandler
    def execute(event)
      scene_id = event.scene_id
      raise "Overwrite me!"
    end
  end
end
