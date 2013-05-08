#          id  6612
# description  邮件
#         api  mail.mail
#      params  mail_id time:str sender_name subject:str body:str money:int attachment[mail_attachment_id item_id quantity] has_read:bool
#        call  vici
#     execute  client

module Vici
  class MailEvent < ViciEvent
    include Singleton

    attr_accessor :mail_id
    attr_accessor :time
    attr_accessor :sender_name
    attr_accessor :subject
    attr_accessor :body
    attr_accessor :money
    class Attachment
      attr_accessor :mail_attachment_id
      attr_accessor :item_id
      attr_accessor :quantity
    end
    attr_accessor :attachments
    attr_accessor :has_read
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      attachments = @attachments.collect do |attachment|
        [attachment.mail_attachment_id, attachment.item_id, attachment.quantity]
      end
      _event_id = 6612
      Packet.pack([_event_id, @mail_id, @time, @sender_name, @subject, @body, @money, attachments, @has_read, @_channel_id, @_account_id])
    end

    private
      def handler
        MailEventHandler.instance
      end
  end
end
