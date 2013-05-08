#          id  6602
# description  邮件已发送
#         api  mail.mail_send_success
#      params  
#        call  vici
#     execute  client

module Vici
  class MailSendSuccessEvent < ViciEvent
    include Singleton

    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 6602
      Packet.pack([_event_id, @_channel_id, @_account_id])
    end

    private
      def handler
        MailSendSuccessEventHandler.instance
      end
  end
end
