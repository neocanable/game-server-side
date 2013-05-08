#          id  6008
# description  新成员加入
#         api  party.party_new_member_joined
#      params  character_id character_name
#        call  vici
#     execute  client

module Vici
  class PartyNewMemberJoinedProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
