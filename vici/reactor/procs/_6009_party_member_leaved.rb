#          id  6009
# description  成员离开
#         api  party.party_member_leaved
#      params  character_id character_name
#        call  vici
#     execute  client

module Vici
  class PartyMemberLeavedProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
