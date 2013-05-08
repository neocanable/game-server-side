module Vici
  module InterfaceHelper

    def check_item_quest_to_destroy(item_id, stack, character = nil)
      item = static_item(item_id)
      player_quests = character.need_item_player_quests(item_id)
      quest_item_destroy(player_quests, item_id, stack, character)
    end

    def quest_item_destroy(player_quests, item_id, stack, character)
      return if PlayerQuest.has_enough_items?(character, player_quests, item_id, stack)
      player_quests.each do |player_quest|
        player_quest.take_away_quest_items!(item_id, stack)
        quest_progress_changed_event(character, player_quest)
      end
    end

    def character_item_quest_event(static_item_id, amount, character)
      item = static_item(static_item_id)
      player_quests = character.need_item_unfinish_player_quests(static_item_id)
      quest_item(player_quests, static_item_id, amount, character)
    end

    # 任务需要物品
    def quest_item(player_quests, item_id, stack, character)
      player_quests.each do |player_quest|
        next if stack <= 0
        player_quest.gain_quest_items!(item_id, stack)
        quest_progress_changed_event(character, player_quest)
      end
    end

    def quest_progress_changed_event(character, player_quest)
      quest_progress_changed(player_quest.quest_id,player_quest.objective1_progress, player_quest.objective2_progress, player_quest.objective3_progress, player_quest.objective4_progress, character.account_id)
    end

    def character_doing_quests_event(player_quests, character)
      doing_quests = player_quests.collect do |player_quest|
        quest = QuestsEvent::Quest.new
        quest.quest_id = player_quest.quest_id
        quest.objective1 = player_quest.objective1_progress 
        quest.objective2 = player_quest.objective2_progress
        quest.objective3 = player_quest.objective3_progress
        quest.objective4 = player_quest.objective4_progress
        quest
      end
      quests(doing_quests, character.account_id)
    end

    def character_available_quests_event(character)
      quests = character.can_do_quests    
      character_available_quests = quests.collect do |quest_id, c|
        quest = AvailableQuestsEvent::Quest.new
        quest.quest_id = quest_id
        quest
      end
      available_quests(character_available_quests, character.account_id)
    end


  end
end  

