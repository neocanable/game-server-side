#          id  6601
# description  发送邮件
#         api  mail.send_mail
#      params  target_character_name subject:str body:str money:int attachment[item_id quantity]
#        call  client
#     execute  vici

module Vici
  class SendMailEventHandler < ViciEventHandler
    def execute(event)
      target_character_name = event.target_character_name
      subject = event.subject
      body = event.body
      money = event.money
      event.attachments.each do |attachment|
        item_id = attachment.item_id
        quantity = attachment.quantity
      end
      raise "Overwrite me!"
    end
  end
end
