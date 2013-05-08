#          id  6004
# description  收到组队邀请
#         api  party.party_invite_request
#      params  request_id leader_character_id leader_name
#        call  vici
#     execute  client

module Vici
  class PartyInviteRequestProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
