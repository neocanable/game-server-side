#          id  6007
# description  组队邀请已拒绝
#         api  party.party_invite_declined
#      params  character_id character_name
#        call  vici
#     execute  client

module Vici
  class PartyInviteDeclinedEvent < ViciEvent
    include Singleton

    attr_accessor :character_id
    attr_accessor :character_name
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 6007
      Packet.pack([_event_id, @character_id, @character_name, @_channel_id, @_account_id])
    end

    private
      def handler
        PartyInviteDeclinedEventHandler.instance
      end
  end
end
