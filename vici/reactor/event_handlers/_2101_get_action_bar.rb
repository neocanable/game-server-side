#          id  2101
# description  取得动作条
#         api  action_bar.get_action_bar
#      params  
#        call  client
#     execute  vici

module Vici
  class GetActionBarEventHandler < ViciEventHandler
    def execute(event)
      raise "Overwrite me!"
    end
  end
end
