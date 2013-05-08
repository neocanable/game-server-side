#          id  2106
# description  交换动作栏
#         api  action_bar.action_bar_swap
#      params  slot1:int slot2:int
#        call  client
#     execute  vici

module Vici
  class ActionBarSwapEventHandler < ViciEventHandler
    def execute(event)
      slot1 = event.slot1
      slot2 = event.slot2
      raise "Overwrite me!"
    end
  end
end
