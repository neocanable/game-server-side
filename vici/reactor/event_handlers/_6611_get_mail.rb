#          id  6611
# description  获取邮件
#         api  mail.get_mail
#      params  mail_id
#        call  client
#     execute  vici

module Vici
  class GetMailEventHandler < ViciEventHandler
    def execute(event)
      mail_id = event.mail_id
      raise "Overwrite me!"
    end
  end
end
