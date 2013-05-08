#          id  6606
# description  取钱
#         api  mail.mail_take_money
#      params  mail_id
#        call  client
#     execute  vici

module Vici
  class MailTakeMoneyEventHandler < ViciEventHandler
    def execute(event)
      mail_id = event.mail_id
      raise "Overwrite me!"
    end
  end
end
