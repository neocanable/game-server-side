#          id  116
# description  处理时钟触发事件
#         api  .process_game_center
#      params  tick:int
#        call  pulse
#     execute  game_center

module Pulse
  class ProcessGameCenterProc < PulseProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
