#          id  6021
# description  玩家离开组队
#         api  party.party_leaved
#      params  party_id account_id
#        call  vici
#     execute  game_center

module Vici
  class PartyLeavedProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
