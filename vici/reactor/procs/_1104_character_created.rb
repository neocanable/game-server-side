#          id  1104
# description  角色创建成功
#         api  character.character_created
#      params  character_id
#        call  vici
#     execute  client

module Vici
  class CharacterCreatedProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
