#          id  6111
# description  掷骰，选择需求
#         api  loot.loot_need_roll
#      params  loot_id party_member_id number:int
#        call  vici
#     execute  client

module Vici
  class LootNeedRollProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
