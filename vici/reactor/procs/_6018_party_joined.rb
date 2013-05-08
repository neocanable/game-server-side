#          id  6018
# description  玩家加入组队
#         api  party.party_joined
#      params  party_id account_id
#        call  vici
#     execute  game_center

module Vici
  class PartyJoinedProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
