module Vici
  module InterfaceHelper
    def mail_list_event(character, mails, page, pages)
      mail_items = mails.collect do |mail|
        mail_item = MailListEvent::Mail.new
        mail_item.mail_id = mail.id
        mail_item.time = mail.created_at.readable_format
        mail_item.sender_name = mail.sender.name
        mail_item.subject = mail.subject
        mail_item.has_money = mail.money.to_i > 0
        mail_item.has_attachments = mail.mail_attachments.size > 0 
        mail_item.has_read = mail.unread
        mail_item
      end
      mail_list(page, pages, mail_items, character.account_id)
    end

    def mail_event(character, mail)
      attachments = mail.mail_attachments.collect do |attachment|
         attachment_item = MailEvent::Attachment.new
         attachment_item.mail_attachment_id = attachment.id
         attachment_item.item_id = attachment.item_id
         attachment_item.quantity = attachment.quantity
         attachment_item
      end
      mail(mail.id, mail.created_at.readable_format, mail.sender.name, mail.subject, mail.content, mail.money, attachments, mail.unread, character.account_id)
    end
  end
end  

