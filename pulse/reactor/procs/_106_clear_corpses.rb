#          id  106
# description  清除尸体
#         api  .clear_corpses
#      params  tick:int
#        call  pulse
#     execute  vici

module Pulse
  class ClearCorpsesProc < PulseProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
