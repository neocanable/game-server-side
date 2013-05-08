module Vici
  class << GossipTalkEventHandler.instance
    def execute(event)
      npc_id = event.npc_id
      character_id = event._character_id

      GossipInterface.talk(character_id, npc_id)
    end
  end

  class << GossipSelectOptionEventHandler.instance
    def execute(event)
      npc_id = event.npc_id
      gossip_id = event.gossip_id
      character_id = event._character_id

      GossipInterface.select_option(character_id, npc_id, gossip_id)
    end
  end
end
