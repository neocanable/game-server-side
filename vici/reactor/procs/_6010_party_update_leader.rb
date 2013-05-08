#          id  6010
# description  队长变化
#         api  party.party_update_leader
#      params  party_id leader_character_id leader_name
#        call  vici
#     execute  game_center

module Vici
  class PartyUpdateLeaderProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
