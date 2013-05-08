#          id  1307
# description  公告
#         api  chat.announce
#      params  message
#       notes  系统向全体玩家发送的消息
#        call  vici
#     execute  chat

module Vici
  class AnnounceProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
