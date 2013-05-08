#          id  6109
# description  拾取已放弃
#         api  loot.loot_pass
#      params  loot_id party_member_id
#        call  vici
#     execute  client

module Vici
  class LootPassProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
