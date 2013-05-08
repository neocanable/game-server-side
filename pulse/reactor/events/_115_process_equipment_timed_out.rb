#          id  115
# description  处理过期的时装
#         api  .process_equipment_timed_out
#      params  tick:int
#        call  pulse
#     execute  vici

module Pulse
  class ProcessEquipmentTimedOutEvent < PulseEvent
    include Singleton

    attr_accessor :tick


    def dump
      _event_id = 115
      Packet.pack([_event_id, @tick])
    end

    private
      def handler
        ProcessEquipmentTimedOutEventHandler.instance
      end
  end
end
