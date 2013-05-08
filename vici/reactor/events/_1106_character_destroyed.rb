#          id  1106
# description  角色删除成功
#         api  character.character_destroyed
#      params  
#        call  vici
#     execute  client

module Vici
  class CharacterDestroyedEvent < ViciEvent
    include Singleton

    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 1106
      Packet.pack([_event_id, @_channel_id, @_account_id])
    end

    private
      def handler
        CharacterDestroyedEventHandler.instance
      end
  end
end
