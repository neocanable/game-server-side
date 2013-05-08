#          id  304
# description  销毁系统频道
#         api  channel.destroy_system_channel
#      params  
#       notes  303.0
#        call  pulse
#     execute  event_pool

module Pulse
  class DestroySystemChannelEvent < PulseEvent
    include Singleton



    def dump
      _event_id = 304
      Packet.pack([_event_id])
    end

    private
      def handler
        DestroySystemChannelEventHandler.instance
      end
  end
end
