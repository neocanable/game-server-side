module Vici
  class GossipInterface < Interface
    class << self

      # 与NPC对话
      def talk(character_id, npc_id)
        character = Character.find_by_id(character_id)
        gossip_id = Gossip.npc_default_gossip(npc_id)
        npc_id, content, gossip_options = Gossip.jump_gossip(npc_id, gossip_id, character)
        gossip_event(npc_id, content, gossip_options, character)
      end
    
      # 对话选项
      def select_option(character_id, npc_id, gossip_id)
        character = Character.find_by_id(character_id)
        gossip    = Gossip.retrieve_gossip(gossip_id)

        npc_id, content, gossip_options = Gossip.jump_link_gossip(npc_id, gossip, character)
        gossip_event(npc_id, content, gossip_options, character)
      end

    end
  end
end  
