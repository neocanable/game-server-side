#          id  301
# description  创建系统频道
#         api  channel.create_system_channel
#      params  
#       notes  301.0
#        call  pulse
#     execute  event_pool

module Pulse
  class CreateSystemChannelEvent < PulseEvent
    include Singleton



    def dump
      _event_id = 301
      Packet.pack([_event_id])
    end

    private
      def handler
        CreateSystemChannelEventHandler.instance
      end
  end
end
