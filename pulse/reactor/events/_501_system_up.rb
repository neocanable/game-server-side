#          id  501
# description  系统启动
#         api  game.system_up
#      params  
#        call  pulse
#     execute  game_center

module Pulse
  class SystemUpEvent < PulseEvent
    include Singleton



    def dump
      _event_id = 501
      Packet.pack([_event_id])
    end

    private
      def handler
        SystemUpEventHandler.instance
      end
  end
end
