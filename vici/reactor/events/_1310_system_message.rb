#          id  1310
# description  系统消息
#         api  chat.system_message
#      params  message account_id
#       notes  系统向单个玩家发送的消息
#        call  vici
#     execute  chat

module Vici
  class SystemMessageEvent < ViciEvent
    include Singleton

    attr_accessor :message
    attr_accessor :account_id


    def dump
      _event_id = 1310
      Packet.pack([_event_id, @message, @account_id])
    end

    private
      def handler
        SystemMessageEventHandler.instance
      end
  end
end
