#          id  6610
# description  删除邮件
#         api  mail.mail_delete
#      params  mail_id
#        call  client
#     execute  vici

module Vici
  class MailDeleteEventHandler < ViciEventHandler
    def execute(event)
      mail_id = event.mail_id
      raise "Overwrite me!"
    end
  end
end
