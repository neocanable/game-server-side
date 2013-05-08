#          id  6004
# description  收到组队邀请
#         api  party.party_invite_request
#      params  request_id leader_character_id leader_name
#        call  vici
#     execute  client

module Vici
  class PartyInviteRequestEvent < ViciEvent
    include Singleton

    attr_accessor :request_id
    attr_accessor :leader_character_id
    attr_accessor :leader_name
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 6004
      Packet.pack([_event_id, @request_id, @leader_character_id, @leader_name, @_channel_id, @_account_id])
    end

    private
      def handler
        PartyInviteRequestEventHandler.instance
      end
  end
end
