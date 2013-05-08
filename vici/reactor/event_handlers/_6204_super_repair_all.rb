#          id  6204
# description  特权修理全部
#         api  merchant.super_repair_all
#      params  
#        call  client
#     execute  vici

module Vici
  class SuperRepairAllEventHandler < ViciEventHandler
    def execute(event)
      raise "Overwrite me!"
    end
  end
end
