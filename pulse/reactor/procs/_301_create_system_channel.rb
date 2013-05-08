#          id  301
# description  创建系统频道
#         api  channel.create_system_channel
#      params  
#       notes  301.0
#        call  pulse
#     execute  event_pool

module Pulse
  class CreateSystemChannelProc < PulseProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
