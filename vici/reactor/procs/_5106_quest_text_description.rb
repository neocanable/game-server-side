#          id  5106
# description  显示任务对话，描述
#         api  quest.quest_text_description
#      params  quest_id
#        call  vici
#     execute  client

module Vici
  class QuestTextDescriptionProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
