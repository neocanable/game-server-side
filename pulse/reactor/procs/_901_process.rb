#          id  901
# description  处理场景
#         api  scene.process
#      params  current_tick:int
#        call  pulse
#     execute  scene_worker
#       proxy  scene_manager

module Pulse
  class ProcessProc < PulseProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
