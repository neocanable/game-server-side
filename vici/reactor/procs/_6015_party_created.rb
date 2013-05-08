#          id  6015
# description  玩家创建组队
#         api  party.party_created
#      params  party_id account1_id account2_id
#        call  vici
#     execute  game_center

module Vici
  class PartyCreatedProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
