#          id  303
# description  销毁系统频道
#         api  channel.destroy_system_channel
#      params  
#        call  pulse
#     execute  event_pool

module Pulse
  class DestroySystemChannelProc < PulseProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
