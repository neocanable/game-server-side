#          id  106
# description  清除尸体
#         api  .clear_corpses
#      params  tick:int
#        call  pulse
#     execute  vici

module Pulse
  class ClearCorpsesEvent < PulseEvent
    include Singleton

    attr_accessor :tick


    def dump
      _event_id = 106
      Packet.pack([_event_id, @tick])
    end

    private
      def handler
        ClearCorpsesEventHandler.instance
      end
  end
end
