class Gossip
  extend StaticHelper 
  class << self
    def valid_gossip(npc_id, character)
      scene = character.scene
      zone  = scene.zone
      zone_npc = Vici::Code.find2(:ZONE_NPC, "zone_id", "npc_id", zone["id"], npc_id)
      raise InvalidNpcError unless zone_npc
    end
    
    def retrieve_npc(npc_id)
      npc = static_npc(npc_id)
      raise InvalidNpcError unless npc
      npc
    end
    
    def npc_default_gossip(npc_id)
      npc = retrieve_npc(npc_id)
      # raise InvalidNpcError if npc['service'] != Vici::NpcService::GOSSIP
      # BUG 没有检查玩家是否可以与npc对话，客户端可以伪造对话，进行非法操作。
      gossip_id = npc['gossip']
    end
    
    def retrieve_gossip(gossip_id)
      raise InvalidGossipError unless gossip_id
      gossip = Vici::Code.first(:GOSSIP, 'id', gossip_id)
      raise InvalidGossipError unless gossip
      gossip
    end
    
    def retrieve_gossip_options(parent_gossip_id, npc_id, character)
      raise InvalidGossipError unless parent_gossip_id
      options = Vici::Code.find(:GOSSIP, 'parent', parent_gossip_id)
      options.collect{|o|
        next unless is_gossip_can_display?(o, npc_id, character)
        content = (o['type'] == Vici::NpcService::QUEST) ? static_quest(o['quest'])['name'] : o['content']
        [o['id'], content, o['type'], o['quest']]
      }.compact
    end
    
    def is_gossip_can_display?(gossip, npc_id, character)
      #return false unless script_condition(gossip, character)
      return false if script_condition(gossip, character) == false
      if gossip["type"] == Vici::NpcService::QUEST
        quest = static_quest(gossip["quest"])
        return false if quest.nil?
        return false if !character.can_accept_quest?(gossip["quest"]) and character.get_with_quest_id(gossip["quest"]).nil?
        player_quest = character.get_with_quest_id(gossip["quest"])
        return false if player_quest.nil? and quest["end_npc"].to_i == npc_id and quest["start_npc"].to_i != npc_id
        return false if player_quest and player_quest.quest["end_npc"].to_i != npc_id
      end
      true
    end

    def script_condition(gossip, character)
      gossip["to_eval"].nil? ? true : (return eval(gossip["to_eval"]))
    end
    
    def retrieve_action(gossip)
      gossip['action']
    end
    
    def retrieve_link_page(gossip)
      gossip['link_to'] if gossip['type'] == Vici::NpcService::GOSSIP
    end
    
    def perform_gossip_action(gossip)
      action_id = retrieve_action(gossip)
      action_params = gossip["action_params"]
      #execute_action(action_id, action_params) if action_id
    end
    
    def jump_link_gossip(npc_id, gossip, character)
      #check_gossip_quests(gossip["id"].to_i)
      link_gossip_id = retrieve_link_page(gossip)
      jump_gossip(npc_id, link_gossip_id, character) if link_gossip_id
    end
    
    def jump_gossip(npc_id, gossip_id, character)
      gossip = retrieve_gossip(gossip_id)
      gossip_option = retrieve_gossip_options(gossip_id, npc_id, character)
      #check_gossip_quests(gossip_id)
      [npc_id, gossip['content'], gossip_option]
    end
    
    # 检查是否有需要gossip_id的任务
    def check_gossip_quests(gossip_id, character_id)
      character = Character.find_by_id(character_id)
      player_quests = character.need_gossip_unfinish_player_quests(gossip_id)
      player_quests.each do |player_quest|
        player_quest.update_gossip_quest!(gossip_id)
        post_quest_progress_event(character.account_id, player_quest)
      end
    end

  end
end
