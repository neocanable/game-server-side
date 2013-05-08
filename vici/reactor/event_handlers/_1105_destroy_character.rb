#          id  1105
# description  删除角色
#         api  character.destroy_character
#      params  character_id
#        call  client
#     execute  vici

module Vici
  class DestroyCharacterEventHandler < ViciEventHandler
    def execute(event)
      character_id = event.character_id
      raise "Overwrite me!"
    end
  end
end
