#          id  5107
# description  显示任务对话，进行中
#         api  quest.quest_text_progress
#      params  quest_id
#        call  vici
#     execute  client

module Vici
  class QuestTextProgressProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
