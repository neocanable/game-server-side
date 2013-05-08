#          id  5112
# description  放弃任务
#         api  quest.abandon_quest
#      params  quest_id
#        call  client
#     execute  vici

module Vici
  class AbandonQuestEventHandler < ViciEventHandler
    def execute(event)
      quest_id = event.quest_id
      raise "Overwrite me!"
    end
  end
end
