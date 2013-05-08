#          id  303
# description  销毁系统频道
#         api  channel.destroy_system_channel
#      params  
#        call  pulse
#     execute  event_pool

module Pulse
  class DestroySystemChannelEvent < PulseEvent
    include Singleton



    def dump
      _event_id = 303
      Packet.pack([_event_id])
    end

    private
      def handler
        DestroySystemChannelEventHandler.instance
      end
  end
end
