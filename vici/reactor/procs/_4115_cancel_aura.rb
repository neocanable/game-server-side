#          id  4115
# description  取消增益效果
#         api  aura.cancel_aura
#      params  aura_id
#        call  vici
#     execute  scene_worker

module Vici
  class CancelAuraProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
