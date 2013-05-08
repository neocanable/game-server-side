#          id  5104
# description  可接任务列表
#         api  quest.available_quests
#      params  quest[quest_id]
#        call  vici
#     execute  client

module Vici
  class AvailableQuestsProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
