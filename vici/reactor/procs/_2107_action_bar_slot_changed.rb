#          id  2107
# description  动作条改变
#         api  action_bar.action_bar_slot_changed
#      params  slot_index action_type:int action_id
#        call  vici
#     execute  client

module Vici
  class ActionBarSlotChangedProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
