#          id  5103
# description  取得可接任务列表
#         api  quest.get_available_quests
#      params  
#        call  client
#     execute  vici

module Vici
  class GetAvailableQuestsEventHandler < ViciEventHandler
    def execute(event)
      raise "Overwrite me!"
    end
  end
end
