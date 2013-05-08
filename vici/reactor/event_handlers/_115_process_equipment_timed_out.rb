#          id  115
# description  处理过期的时装
#         api  .process_equipment_timed_out
#      params  tick:int
#        call  pulse
#     execute  vici

module Vici
  class ProcessEquipmentTimedOutEventHandler < ViciEventHandler
    def execute(event)
      tick = event.tick
      raise "Overwrite me!"
    end
  end
end
