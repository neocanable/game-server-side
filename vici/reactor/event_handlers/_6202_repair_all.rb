#          id  6202
# description  全部修理
#         api  merchant.repair_all
#      params  
#        call  client
#     execute  vici

module Vici
  class RepairAllEventHandler < ViciEventHandler
    def execute(event)
      raise "Overwrite me!"
    end
  end
end
