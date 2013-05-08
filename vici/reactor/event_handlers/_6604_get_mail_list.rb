#          id  6604
# description  收件箱
#         api  mail.get_mail_list
#      params  page
#        call  client
#     execute  vici

module Vici
  class GetMailListEventHandler < ViciEventHandler
    def execute(event)
      page = event.page
      raise "Overwrite me!"
    end
  end
end
