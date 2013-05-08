#          id  6110
# description  需求
#         api  loot.loot_need
#      params  loot_id
#        call  client
#     execute  vici

module Vici
  class LootNeedEventHandler < ViciEventHandler
    def execute(event)
      loot_id = event.loot_id
      raise "Overwrite me!"
    end
  end
end
