#          id  6206
# description  装备耐久变化
#         api  merchant.durability_changed
#      params  container_type:int slot_index item_id durability:int max_durability:int
#        call  vici
#     execute  client

module Vici
  class DurabilityChangedProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
