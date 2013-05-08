module Vici
  module InterfaceHelper
    def kill_npc_quest_event(dead_npc_id, character)
      if party = character.party
        party_kill_npc(dead_npc_id, party, character)
      else
        sigle_kill_npc(dead_npc_id, character)
      end
    end

    # 单人杀死npc任务
    def sigle_kill_npc(npc_id, character)
      player_quests = character.need_npc_unfinish_player_quests(npc_id)
      player_quests.each do |player_quest|
        player_quest.update_npc_quest!(npc_id)
        quest_progress_changed_event(character, player_quest)
      end
    end

    # 队伍杀死npc任务
    def party_kill_npc(npc_id, party, character)
      player_quests = party.need_npc_quests(npc_id, character)
      player_quests.each do |player_quest|
        player_quest.update_npc_quest!(npc_id)
        quest_progress_changed_event(character, player_quest)
      end
    end

  end
end  

