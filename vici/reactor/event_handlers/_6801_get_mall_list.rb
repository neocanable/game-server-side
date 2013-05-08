#          id  6801
# description  商城
#         api  mall.get_mall_list
#      params  tab:int page
#        call  client
#     execute  vici

module Vici
  class GetMallListEventHandler < ViciEventHandler
    def execute(event)
      tab = event.tab
      page = event.page
      raise "Overwrite me!"
    end
  end
end
