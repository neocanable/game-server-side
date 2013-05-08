#          id  6603
# description  有未读的邮件
#         api  mail.update_pending_mail
#      params  
#        call  vici
#     execute  client

module Vici
  class UpdatePendingMailProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
