#          id  1101
# description  角色列表
#         api  character.get_character_list
#      params  
#        call  client
#     execute  vici

module Vici
  class GetCharacterListEventHandler < ViciEventHandler
    def execute(event)
      raise "Overwrite me!"
    end
  end
end
