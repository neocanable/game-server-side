#          id  6013
# description  踢出队伍
#         api  party.party_uninvite
#      params  character_id
#        call  client
#     execute  vici

module Vici
  class PartyUninviteEventHandler < ViciEventHandler
    def execute(event)
      character_id = event.character_id
      raise "Overwrite me!"
    end
  end
end
