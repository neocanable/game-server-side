#          id  5108
# description  显示任务对话，完成
#         api  quest.quest_text_complete
#      params  quest_id
#        call  vici
#     execute  client

module Vici
  class QuestTextCompleteProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
