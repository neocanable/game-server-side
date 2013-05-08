#          id  6113
# description  掷骰，选择贪婪
#         api  loot.loot_greed_roll
#      params  loot_id party_member_id number:int
#        call  vici
#     execute  client

module Vici
  class LootGreedRollProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
