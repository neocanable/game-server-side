#          id  6112
# description  贪婪
#         api  loot.loot_greed
#      params  loot_id
#        call  client
#     execute  vici

module Vici
  class LootGreedEventHandler < ViciEventHandler
    def execute(event)
      loot_id = event.loot_id
      raise "Overwrite me!"
    end
  end
end
