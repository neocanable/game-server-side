#          id  6402
# description  玩家称号列表
#         api  title.title_list
#      params  title[title_id] selected_title_id:int
#        call  vici
#     execute  client

module Vici
  class TitleListProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
