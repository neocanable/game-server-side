#          id  6403
# description  使用称号
#         api  title.select_title
#      params  title_id
#        call  client
#     execute  vici

module Vici
  class SelectTitleEventHandler < ViciEventHandler
    def execute(event)
      title_id = event.title_id
      raise "Overwrite me!"
    end
  end
end
