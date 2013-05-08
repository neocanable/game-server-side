#          id  1307
# description  公告
#         api  chat.announce
#      params  message
#       notes  系统向全体玩家发送的消息
#        call  vici
#     execute  chat

module Vici
  class AnnounceEvent < ViciEvent
    include Singleton

    attr_accessor :message


    def dump
      _event_id = 1307
      Packet.pack([_event_id, @message])
    end

    private
      def handler
        AnnounceEventHandler.instance
      end
  end
end
