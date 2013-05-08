#          id  6007
# description  组队邀请已拒绝
#         api  party.party_invite_declined
#      params  character_id character_name
#        call  vici
#     execute  client

module Vici
  class PartyInviteDeclinedProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
