#          id  6108
# description  放弃
#         api  loot.loot_close
#      params  loot_id
#        call  client
#     execute  vici

module Vici
  class LootCloseEventHandler < ViciEventHandler
    def execute(event)
      loot_id = event.loot_id
      raise "Overwrite me!"
    end
  end
end
