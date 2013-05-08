#          id  1310
# description  系统消息
#         api  chat.system_message
#      params  message account_id
#       notes  系统向单个玩家发送的消息
#        call  vici
#     execute  chat

module Vici
  class SystemMessageProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
