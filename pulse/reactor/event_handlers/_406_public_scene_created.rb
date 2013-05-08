#          id  406
# description  公共场景已创建
#         api  public_sence.public_scene_created
#      params  scene_id
#        call  game_center
#     execute  pulse

module Pulse
  class PublicSceneCreatedEventHandler < PulseEventHandler
    def execute(event)
      scene_id = event.scene_id
      raise "Overwrite me!"
    end
  end
end
