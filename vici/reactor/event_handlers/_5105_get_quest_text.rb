#          id  5105
# description  取得任务对话
#         api  quest.get_quest_text
#      params  quest_id
#        call  client
#     execute  vici

module Vici
  class GetQuestTextEventHandler < ViciEventHandler
    def execute(event)
      quest_id = event.quest_id
      raise "Overwrite me!"
    end
  end
end
