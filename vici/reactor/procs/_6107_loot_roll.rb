#          id  6107
# description  需要掷骰决定的拾取
#         api  loot.loot_roll
#      params  loot_id static_item_id quantity
#        call  vici
#     execute  client

module Vici
  class LootRollProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
