#          id  6613
# description  邮件被删除
#         api  mail.mail_deleted
#      params  mail_id
#        call  vici
#     execute  client

module Vici
  class MailDeletedProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
