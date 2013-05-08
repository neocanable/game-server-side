#          id  501
# description  系统启动
#         api  game.system_up
#      params  
#        call  pulse
#     execute  game_center

module Pulse
  class SystemUpProc < PulseProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
