#          id  502
# description  系统关闭
#         api  game.system_down
#      params  
#        call  pulse
#     execute  game_center

module Pulse
  class SystemDownProc < PulseProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
