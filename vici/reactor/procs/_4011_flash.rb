#          id  4011
# description  场景内瞬移
#         api  activity.flash
#      params  character_id dest_x dest_y
#        call  vici
#     execute  scene_worker

module Vici
  class FlashProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
