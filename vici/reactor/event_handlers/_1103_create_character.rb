#          id  1103
# description  创建角色
#         api  character.create_character
#      params  name appearance_id
#        call  client
#     execute  vici

module Vici
  class CreateCharacterEventHandler < ViciEventHandler
    def execute(event)
      name = event.name
      appearance_id = event.appearance_id
      raise "Overwrite me!"
    end
  end
end
