#          id  6305
# description  取得购回列表
#         api  merchant.get_buyback_list
#      params  npc_id
#        call  client
#     execute  vici

module Vici
  class GetBuybackListEventHandler < ViciEventHandler
    def execute(event)
      npc_id = event.npc_id
      raise "Overwrite me!"
    end
  end
end
