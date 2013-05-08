#          id  6009
# description  成员离开
#         api  party.party_member_leaved
#      params  character_id character_name
#        call  vici
#     execute  client

module Vici
  class PartyMemberLeavedEvent < ViciEvent
    include Singleton

    attr_accessor :character_id
    attr_accessor :character_name
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 6009
      Packet.pack([_event_id, @character_id, @character_name, @_channel_id, @_account_id])
    end

    private
      def handler
        PartyMemberLeavedEventHandler.instance
      end
  end
end
