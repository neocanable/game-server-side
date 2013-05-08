#          id  6602
# description  邮件已发送
#         api  mail.mail_send_success
#      params  
#        call  vici
#     execute  client

module Vici
  class MailSendSuccessProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
