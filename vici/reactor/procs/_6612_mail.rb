#          id  6612
# description  邮件
#         api  mail.mail
#      params  mail_id time:str sender_name subject:str body:str money:int attachment[mail_attachment_id item_id quantity] has_read:bool
#        call  vici
#     execute  client

module Vici
  class MailProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
