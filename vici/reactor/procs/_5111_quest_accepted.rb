#          id  5111
# description  任务已接受
#         api  quest.quest_accepted
#      params  quest_id
#        call  vici
#     execute  client

module Vici
  class QuestAcceptedProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
