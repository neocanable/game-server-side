#          id  6401
# description  取得玩家称号列表
#         api  title.get_title_list
#      params  
#        call  client
#     execute  vici

module Vici
  class GetTitleListEventHandler < ViciEventHandler
    def execute(event)
      raise "Overwrite me!"
    end
  end
end
