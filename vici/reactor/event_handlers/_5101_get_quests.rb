#          id  5101
# description  取得已接受的任务列表
#         api  quest.get_quests
#      params  
#        call  client
#     execute  vici

module Vici
  class GetQuestsEventHandler < ViciEventHandler
    def execute(event)
      raise "Overwrite me!"
    end
  end
end
