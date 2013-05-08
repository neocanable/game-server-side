#          id  1309
# description  处理GM命令
#         api  chat.gm_command
#      params  command:str
#       notes  玩家聊天，如果第一个字符是'/'，则认为是GM命令
#        call  chat
#     execute  vici

module Vici
  class GmCommandEventHandler < ViciEventHandler
    def execute(event)
      command = event.command
      raise "Overwrite me!"
    end
  end
end
