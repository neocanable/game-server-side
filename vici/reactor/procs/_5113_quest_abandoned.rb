#          id  5113
# description  任务已放弃
#         api  quest.quest_abandoned
#      params  quest_id
#        call  vici
#     execute  client

module Vici
  class QuestAbandonedProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
