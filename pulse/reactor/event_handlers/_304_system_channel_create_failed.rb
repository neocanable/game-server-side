#          id  304
# description  系统频道创建失败
#         api  channel.system_channel_create_failed
#      params  
#        call  event_pool
#     execute  pulse

module Pulse
  class SystemChannelCreateFailedEventHandler < PulseEventHandler
    def execute(event)
      raise "Overwrite me!"
    end
  end
end
