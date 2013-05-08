#          id  4504
# description  玩家已升级
#         api  combat.update_level
#      params  character_id new_level
#        call  vici
#     execute  scene_worker

module Vici
  class UpdateLevelProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
