#          id  5114
# description  完成任务
#         api  quest.complete_quest
#      params  quest_id reward_selected:int
#        call  client
#     execute  vici

module Vici
  class CompleteQuestEventHandler < ViciEventHandler
    def execute(event)
      quest_id = event.quest_id
      reward_selected = event.reward_selected
      raise "Overwrite me!"
    end
  end
end
