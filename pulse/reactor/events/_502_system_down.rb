#          id  502
# description  系统关闭
#         api  game.system_down
#      params  
#        call  pulse
#     execute  game_center

module Pulse
  class SystemDownEvent < PulseEvent
    include Singleton



    def dump
      _event_id = 502
      Packet.pack([_event_id])
    end

    private
      def handler
        SystemDownEventHandler.instance
      end
  end
end
