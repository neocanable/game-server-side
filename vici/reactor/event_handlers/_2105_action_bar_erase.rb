#          id  2105
# description  清除动作栏
#         api  action_bar.action_bar_erase
#      params  slot_index
#        call  client
#     execute  vici

module Vici
  class ActionBarEraseEventHandler < ViciEventHandler
    def execute(event)
      slot_index = event.slot_index
      raise "Overwrite me!"
    end
  end
end
