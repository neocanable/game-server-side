module Vici
#  class << SendMailEventHandler.instance
#    def execute(event)
#      target_character_name = event.target_character_name
#      subject = event.subject
#      body = event.body
#      money = event.money
#      event.attachments.each do |attachment|
#        item_id = attachment.item_id
#        quantity = attachment.quantity
#      end
#      
#    end
#  end

  class << GetMailListEventHandler.instance
    def execute(event)
      page         = event.page
      character_id = event._character_id
      character    = Character.find_by_id(character_id)

      MailInterface.inbox(character, page)
    end
  end

  class << MailTakeMoneyEventHandler.instance
    def execute(event)
      mail_id      = event.mail_id
      character_id = event._character_id
      character    = Character.find_by_id(character_id)     

      MailInterface.receive_money(character, mail_id)
    end
  end

  class << MailTakeItemEventHandler.instance
    def execute(event)
      mail_id       = event.mail_id
      attachment_id = event.attachment_id
      character_id  = event._character_id
      character     = Character.find_by_id(character_id)          

      MailInterface.receive_attachment(character, mail_id, attachment_id)
    end
  end

  class << MailMarkAsReadEventHandler.instance
    def execute(event)
      mail_id = event.mail_id
      character_id  = event._character_id
      character     = Character.find_by_id(character_id)               

    end
  end

  class << MailDeleteEventHandler.instance
    def execute(event)
      mail_id = event.mail_id
      character_id  = event._character_id
      character     = Character.find_by_id(character_id)                    
      MailInterface.destroy_mail(character, mail_id)
    end
  end

  class << GetMailEventHandler.instance
    def execute(event)
      mail_id = event.mail_id
      character_id  = event._character_id
      character     = Character.find_by_id(character_id)                               
      MailInterface.receive_mail(character, mail_id)
    end
  end

  class << SendMailEventHandler.instance 
    def execute(event)
      target_character_name = event.target_character_name
      subject = event.subject
      body = event.body
      money = event.money
      attachments = event.attachments
      character_id = event._character_id
      character = Character.find_by_id(character_id)
      #send_mail(sender, target_character_name, subject, body, money, attachments)
     
      MailInterface.send_mail(character, target_character_name, subject, body, money, attachments)
    end
  end
end

