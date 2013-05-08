#          id  1102
# description  角色列表
#         api  character.character_list
#      params  character[character_id name appearance_id profession_id level zone_id head_id chest_id weapon_id] last_online_character_id
#       notes  head_id chest_id weapon_id 均为static_item_id
#        call  vici
#     execute  client

module Vici
  class CharacterListProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
