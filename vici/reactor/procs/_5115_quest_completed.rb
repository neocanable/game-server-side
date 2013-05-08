#          id  5115
# description  任务已完成
#         api  quest.quest_completed
#      params  quest_id next_quest_id
#        call  vici
#     execute  client

module Vici
  class QuestCompletedProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
