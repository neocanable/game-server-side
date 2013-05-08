#          id  6605
# description  收件箱
#         api  mail.mail_list
#      params  page total_pages:int mail[mail_id time:str sender_name subject:str has_money:bool has_attachments:bool has_read:bool]
#        call  vici
#     execute  client

module Vici
  class MailListEvent < ViciEvent
    include Singleton

    attr_accessor :page
    attr_accessor :total_pages
    class Mail
      attr_accessor :mail_id
      attr_accessor :time
      attr_accessor :sender_name
      attr_accessor :subject
      attr_accessor :has_money
      attr_accessor :has_attachments
      attr_accessor :has_read
    end
    attr_accessor :mails
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      mails = @mails.collect do |mail|
        [mail.mail_id, mail.time, mail.sender_name, mail.subject, mail.has_money, mail.has_attachments, mail.has_read]
      end
      _event_id = 6605
      Packet.pack([_event_id, @page, @total_pages, mails, @_channel_id, @_account_id])
    end

    private
      def handler
        MailListEventHandler.instance
      end
  end
end
