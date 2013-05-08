#          id  302
# description  系统频道创建成功
#         api  channel.system_channel_create_succeeded
#      params  
#       notes  302.0
#        call  event_pool
#     execute  pulse

module Pulse
  class SystemChannelCreateSucceededEventHandler < PulseEventHandler
    def execute(event)
      raise "Overwrite me!"
    end
  end
end
