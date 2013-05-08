#          id  5002
# description  选择对话项
#         api  gossip.gossip_select_option
#      params  npc_id gossip_id
#       notes  
#        call  client
#     execute  vici

module Vici
  class GossipSelectOptionEventHandler < ViciEventHandler
    def execute(event)
      npc_id = event.npc_id
      gossip_id = event.gossip_id
      raise "Overwrite me!"
    end
  end
end
