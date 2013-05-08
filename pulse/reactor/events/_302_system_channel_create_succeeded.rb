#          id  302
# description  系统频道创建成功
#         api  channel.system_channel_create_succeeded
#      params  
#       notes  302.0
#        call  event_pool
#     execute  pulse

module Pulse
  class SystemChannelCreateSucceededEvent < PulseEvent
    include Singleton


    def load(packet, connection = nil)
      @connection = connection
      @packet = packet
      data = packet.unpack
    end


    private
      def handler
        SystemChannelCreateSucceededEventHandler.instance
      end
  end
end
