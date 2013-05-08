#          id  6014
# description  提升为队长
#         api  party.party_set_leader
#      params  character_id
#        call  client
#     execute  vici

module Vici
  class PartySetLeaderEventHandler < ViciEventHandler
    def execute(event)
      character_id = event.character_id
      raise "Overwrite me!"
    end
  end
end
