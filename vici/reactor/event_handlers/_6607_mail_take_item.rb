#          id  6607
# description  取附件
#         api  mail.mail_take_item
#      params  mail_id attachment_id
#        call  client
#     execute  vici

module Vici
  class MailTakeItemEventHandler < ViciEventHandler
    def execute(event)
      mail_id = event.mail_id
      attachment_id = event.attachment_id
      raise "Overwrite me!"
    end
  end
end
