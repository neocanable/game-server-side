#          id  5109
# description  任务进度
#         api  quest.quest_progress_changed
#      params  quest_id objective1:int objective2:int objective3:int objective4:int
#        call  vici
#     execute  client

module Vici
  class QuestProgressChangedProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
