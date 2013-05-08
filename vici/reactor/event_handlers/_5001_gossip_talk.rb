#          id  5001
# description  与NPC对话
#         api  gossip.gossip_talk
#      params  npc_id
#       notes  
#        call  client
#     execute  vici

module Vici
  class GossipTalkEventHandler < ViciEventHandler
    def execute(event)
      npc_id = event.npc_id
      raise "Overwrite me!"
    end
  end
end
