#          id  303
# description  系统频道创建失败
#         api  channel.system_channel_create_failed
#      params  
#       notes  304.0
#        call  event_pool
#     execute  pulse

module Pulse
  class SystemChannelCreateFailedEvent < PulseEvent
    include Singleton


    def load(packet, connection = nil)
      @connection = connection
      @packet = packet
      data = packet.unpack
    end


    private
      def handler
        SystemChannelCreateFailedEventHandler.instance
      end
  end
end
