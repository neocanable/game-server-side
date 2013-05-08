#          id  901
# description  处理场景
#         api  scene.process
#      params  current_tick:int
#        call  pulse
#     execute  scene_worker
#       proxy  scene_manager

module Pulse
  class ProcessEvent < PulseEvent
    include Singleton

    attr_accessor :current_tick


    def dump
      _event_id = 901
      Packet.pack([_event_id, @current_tick])
    end

    private
      def handler
        ProcessEventHandler.instance
      end
  end
end
