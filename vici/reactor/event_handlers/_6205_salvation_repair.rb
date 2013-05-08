#          id  6205
# description  恢复耐久上限
#         api  merchant.salvation_repair
#      params  container_type:int slot_index
#        call  client
#     execute  vici

module Vici
  class SalvationRepairEventHandler < ViciEventHandler
    def execute(event)
      container_type = event.container_type
      slot_index = event.slot_index
      raise "Overwrite me!"
    end
  end
end
