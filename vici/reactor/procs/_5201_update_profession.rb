#          id  5201
# description  转职
#         api  combat.update_profession
#      params  character_id new_profession_id
#        call  vici
#     execute  scene_worker

module Vici
  class UpdateProfessionProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
