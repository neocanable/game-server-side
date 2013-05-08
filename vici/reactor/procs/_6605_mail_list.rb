#          id  6605
# description  收件箱
#         api  mail.mail_list
#      params  page total_pages:int mail[mail_id time:str sender_name subject:str has_money:bool has_attachments:bool has_read:bool]
#        call  vici
#     execute  client

module Vici
  class MailListProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
