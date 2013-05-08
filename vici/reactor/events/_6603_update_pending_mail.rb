#          id  6603
# description  有未读的邮件
#         api  mail.update_pending_mail
#      params  
#        call  vici
#     execute  client

module Vici
  class UpdatePendingMailEvent < ViciEvent
    include Singleton

    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 6603
      Packet.pack([_event_id, @_channel_id, @_account_id])
    end

    private
      def handler
        UpdatePendingMailEventHandler.instance
      end
  end
end
