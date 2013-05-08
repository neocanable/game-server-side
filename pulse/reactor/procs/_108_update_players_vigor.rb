#          id  108
# description  恢复玩家精力值
#         api  .update_players_vigor
#      params  tick:int
#        call  pulse
#     execute  vici

module Pulse
  class UpdatePlayersVigorProc < PulseProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
