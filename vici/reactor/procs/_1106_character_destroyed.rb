#          id  1106
# description  角色删除成功
#         api  character.character_destroyed
#      params  
#        call  vici
#     execute  client

module Vici
  class CharacterDestroyedProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
