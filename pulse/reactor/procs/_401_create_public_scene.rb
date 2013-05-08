#          id  401
# description  创建公共场景
#         api  public_sence.create_public_scene
#      params  scene_id zone_id
#        call  pulse
#     execute  scene_worker
#       proxy  scene_manager

module Pulse
  class CreatePublicSceneProc < PulseProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
