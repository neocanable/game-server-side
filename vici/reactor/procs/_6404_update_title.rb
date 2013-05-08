#          id  6404
# description  更换称号
#         api  combat.update_title
#      params  character_id title_id
#        call  vici
#     execute  scene_worker

module Vici
  class UpdateTitleProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
