#          id  5003
# description  NPC对话内容
#         api  gossip.gossip_content
#      params  npc_id content:str option[gossip_id content:str type:int quest_id]
#       notes  
#        call  vici
#     execute  client

module Vici
  class GossipContentProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
