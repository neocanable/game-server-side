#          id  6001
# description  取得玩家的组队信息
#         api  party.party_get_info
#      params  
#        call  client
#     execute  vici

module Vici
  class PartyGetInfoEventHandler < ViciEventHandler
    def execute(event)
      raise "Overwrite me!"
    end
  end
end
