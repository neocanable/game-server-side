#          id  6012
# description  离开队伍
#         api  party.party_leave
#      params  
#        call  client
#     execute  vici

module Vici
  class PartyLeaveEventHandler < ViciEventHandler
    def execute(event)
      raise "Overwrite me!"
    end
  end
end
