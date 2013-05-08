#          id  6613
# description  邮件被删除
#         api  mail.mail_deleted
#      params  mail_id
#        call  vici
#     execute  client

module Vici
  class MailDeletedEvent < ViciEvent
    include Singleton

    attr_accessor :mail_id
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 6613
      Packet.pack([_event_id, @mail_id, @_channel_id, @_account_id])
    end

    private
      def handler
        MailDeletedEventHandler.instance
      end
  end
end
