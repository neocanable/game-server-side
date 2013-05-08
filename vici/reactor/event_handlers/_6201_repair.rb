#          id  6201
# description  修理
#         api  merchant.repair
#      params  container_type:int slot_index
#        call  client
#     execute  vici

module Vici
  class RepairEventHandler < ViciEventHandler
    def execute(event)
      container_type = event.container_type
      slot_index = event.slot_index
      raise "Overwrite me!"
    end
  end
end
