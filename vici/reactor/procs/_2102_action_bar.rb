#          id  2102
# description  动作条
#         api  action_bar.action_bar
#      params  action_bar[slot_index action_type:int action_id]
#        call  vici
#     execute  client

module Vici
  class ActionBarProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
