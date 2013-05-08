#          id  6008
# description  新成员加入
#         api  party.party_new_member_joined
#      params  character_id character_name
#        call  vici
#     execute  client

module Vici
  class PartyNewMemberJoinedEvent < ViciEvent
    include Singleton

    attr_accessor :character_id
    attr_accessor :character_name
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 6008
      Packet.pack([_event_id, @character_id, @character_name, @_channel_id, @_account_id])
    end

    private
      def handler
        PartyNewMemberJoinedEventHandler.instance
      end
  end
end
