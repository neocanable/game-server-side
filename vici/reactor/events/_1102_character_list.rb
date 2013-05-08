#          id  1102
# description  角色列表
#         api  character.character_list
#      params  character[character_id name appearance_id profession_id level zone_id head_id chest_id weapon_id] last_online_character_id
#       notes  head_id chest_id weapon_id 均为static_item_id
#        call  vici
#     execute  client

module Vici
  class CharacterListEvent < ViciEvent
    include Singleton

    class Character
      attr_accessor :character_id
      attr_accessor :name
      attr_accessor :appearance_id
      attr_accessor :profession_id
      attr_accessor :level
      attr_accessor :zone_id
      attr_accessor :head_id
      attr_accessor :chest_id
      attr_accessor :weapon_id
    end
    attr_accessor :characters
    attr_accessor :last_online_character_id
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      characters = @characters.collect do |character|
        [character.character_id, character.name, character.appearance_id, character.profession_id, character.level, character.zone_id, character.head_id, character.chest_id, character.weapon_id]
      end
      _event_id = 1102
      Packet.pack([_event_id, characters, @last_online_character_id, @_channel_id, @_account_id])
    end

    private
      def handler
        CharacterListEventHandler.instance
      end
  end
end
