#          id  5102
# description  任务列表
#         api  quest.quests
#      params  quest[quest_id objective1:int objective2:int objective3:int objective4:int]
#        call  vici
#     execute  client

module Vici
  class QuestsProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
