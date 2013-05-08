#          id  242
# description  进入场景
#         api  scene.scene_enter
#      params  character_id zone_id x y
#        call  vici
#     execute  game_center

module Vici
  class SceneEnterProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
