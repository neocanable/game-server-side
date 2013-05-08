#          id  303
# description  系统频道创建失败
#         api  channel.system_channel_create_failed
#      params  
#       notes  304.0
#        call  event_pool
#     execute  pulse

module Pulse
  class SystemChannelCreateFailedEventHandler < PulseEventHandler
    def execute(event)
      raise "Overwrite me!"
    end
  end
end
