#          id  6203
# description  特权修理
#         api  merchant.super_repair
#      params  container_type:int slot_index
#        call  client
#     execute  vici

module Vici
  class SuperRepairEventHandler < ViciEventHandler
    def execute(event)
      container_type = event.container_type
      slot_index = event.slot_index
      raise "Overwrite me!"
    end
  end
end
