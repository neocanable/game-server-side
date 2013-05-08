#          id  4008
# description  使用动作
#         api  activity.use_action
#      params  character_id action_id
#        call  vici
#     execute  scene_worker

module Vici
  class UseActionProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
