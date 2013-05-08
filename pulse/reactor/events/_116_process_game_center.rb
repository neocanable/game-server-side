#          id  116
# description  处理时钟触发事件
#         api  .process_game_center
#      params  tick:int
#        call  pulse
#     execute  game_center

module Pulse
  class ProcessGameCenterEvent < PulseEvent
    include Singleton

    attr_accessor :tick


    def dump
      _event_id = 116
      Packet.pack([_event_id, @tick])
    end

    private
      def handler
        ProcessGameCenterEventHandler.instance
      end
  end
end
