#          id  115
# description  处理过期的时装
#         api  .process_equipment_timed_out
#      params  tick:int
#        call  pulse
#     execute  vici

module Pulse
  class ProcessEquipmentTimedOutProc < PulseProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
