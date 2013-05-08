#          id  6608
# description  收邮件
#         api  mail.mail_mark_as_read
#      params  mail_id
#        call  client
#     execute  vici

module Vici
  class MailMarkAsReadEventHandler < ViciEventHandler
    def execute(event)
      mail_id = event.mail_id
      raise "Overwrite me!"
    end
  end
end
