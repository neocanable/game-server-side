module Vici
  module InterfaceHelper
    def gossip_event(npc_id, content, gossip_options, character)
      options = gossip_options.collect do |gossip_option|
        option = GossipContentEvent::Option.new
        option.gossip_id = gossip_option[0]
        option.content   = gossip_option[1]
        option.type      = gossip_option[2]
        option.quest_id  = gossip_option[3]
        option
      end        
      gossip_content(npc_id, content, options, character.account_id)
    end
  end
end  

