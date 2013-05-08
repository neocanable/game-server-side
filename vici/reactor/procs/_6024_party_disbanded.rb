#          id  6024
# description  解散组队
#         api  party.party_disbanded
#      params  party_id
#        call  vici
#     execute  game_center

module Vici
  class PartyDisbandedProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
