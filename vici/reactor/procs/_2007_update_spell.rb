#          id  2007
# description  玩家技能改变
#         api  combat.update_spell
#      params  character_id
#       notes  learn_spell?
#        call  vici
#     execute  scene_worker

module Vici
  class UpdateSpellProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
