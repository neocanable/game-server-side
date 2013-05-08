#          id  5110
# description  接受任务
#         api  quest.accept_quest
#      params  quest_id
#        call  client
#     execute  vici

module Vici
  class AcceptQuestEventHandler < ViciEventHandler
    def execute(event)
      quest_id = event.quest_id
      raise "Overwrite me!"
    end
  end
end
