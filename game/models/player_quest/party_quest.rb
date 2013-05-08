class Party < ActiveRecord::Base
  def need_npc_quests(npc_id, character = nil)
    player_quests = PlayerQuest.find(:all,:conditions => ["character_id IN (?)", self.same_scene_characters(character).collect{|e| e.id }])   
    player_quests.collect{|player_quest| 
      player_quest.need_npc_count(npc_id) > 0 ? player_quest : nil
    }.compact
  end

  def need_item_quests(static_item_idm, character = nil)
    player_quests = PlayerQuest.find(:all,:conditions => ["character_id IN (?)", self.same_scene_characters(character).collect{|e| e.id }])   
    player_quests.collect{|player_quest| 
      player_quest.need_item_count(static_item_id) > 0 ? player_quest : nil
    }.compact
  end
end
