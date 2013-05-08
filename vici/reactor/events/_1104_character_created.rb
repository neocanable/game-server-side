#          id  1104
# description  角色创建成功
#         api  character.character_created
#      params  character_id
#        call  vici
#     execute  client

module Vici
  class CharacterCreatedEvent < ViciEvent
    include Singleton

    attr_accessor :character_id
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 1104
      Packet.pack([_event_id, @character_id, @_channel_id, @_account_id])
    end

    private
      def handler
        CharacterCreatedEventHandler.instance
      end
  end
end
