#          id  115
# description  处理过期的时装
#         api  .process_equipment_timed_out
#      params  tick:int
#        call  pulse
#     execute  vici

module Vici
  class ProcessEquipmentTimedOutEvent < ViciEvent
    include Singleton

    attr_accessor :tick

    def load(packet, connection = nil)
      @connection = connection
      @packet = packet
      data = packet.unpack
      @tick = data[1]
    end


    private
      def handler
        ProcessEquipmentTimedOutEventHandler.instance
      end
  end
end
