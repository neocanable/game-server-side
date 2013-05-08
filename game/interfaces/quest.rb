module Vici
  class QuestInterface < Interface
    class << self
      def get_quests(character_id)
        character = Character.find_by_id(character_id)

        character_doing_quests_event(character.player_quests, character)
      end

      def get_available_quests(character_id)
        character = Character.find_by_id(character_id)

        character_available_quests_event(character)
      end

      def accept_quest(character_id, quest_id)
        quest = static_quest(quest_id)
        character    = Character.find_by_id(character_id)       

        character_accept_quest_action(character, quest)
        player_quest = character.accept_quest(quest_id)

        quest_accepted(player_quest.quest_id, character.account_id)
        quest_progress_changed_event(character, player_quest)
      end

      def get_quest_text(quest_id, character_id)
        character    = Character.find_by_id(character_id)

        account_id   = character.account_id
        player_quest   = character.get_with_quest_id(quest_id)
        complete_quest = character.get_completed_quest(quest_id)
        can_accept     = character.can_accept_quest?(quest_id)
  
        if player_quest and !player_quest.has_finished?
          quest_text_progress(quest_id, account_id)
        elsif player_quest and player_quest.has_finished?
          quest_text_complete(quest_id, account_id)
        elsif player_quest.nil? and can_accept
          quest_text_description(quest_id, account_id)
        elsif player_quest.nil? and !can_accept and complete_quest.nil?
          quest_text_description(quest_id, account_id)
        end
      end

      def complete_quest(character, quest_id, reward_selected)
        quest = static_quest(quest_id)  

        character.complete_quest(quest)
        complete_quest_xp(character, quest)
        complete_quest_items(character, quest, reward_selected)
        complete_quest_money(character, quest)

        character_available_quests_event(character)
        complete_quest_and_send_next_quest(character, quest)

        # 完成任务的action
        character_complete_quest_action(character, quest)
      end

      def abandon_quest(character_id, quest_id)
        character = Character.find_by_id(character_id)       
        character.abandon_quest(quest_id)

        quest_abandoned(quest_id, character.account_id)
      end


      def complete_quest_items(character, quest, selectd_option)  
        take_away_items = character.take_away_quest_items(quest)
        items           = character.complete_quest_items(quest, selectd_option)  
        items += take_away_items
        container_slot_changed_event(items, character)
      end

      def complete_quest_and_send_next_quest(character, quest)
        next_quest_id = character.next_quest(quest)
        quest_completed(quest["id"].to_i, next_quest_id, character.account_id)
      end

      def complete_quest_money(character, quest)
        money = quest["gain_money"].to_i
        character_gain_money_event(character, money) 
        info_logger.quest_reward_money(quest["id"].to_i, character.id, character.level, character.profession, money)
      end

      def complete_quest_xp(character, quest)
        xp = quest["gain_xp"].to_i
        character_gain_xp_event(character, xp)

        info_logger.quest_reward_xp(quest["id"].to_i, character.id, character.level, character.profession, xp)
      end

      def character_accept_quest_action(character, quest)
        return unless quest["accept_action"]
        use_action_event(character, quest["accept_action"].to_i, quest["accept_action_params"].to_i)
      end

      def character_complete_quest_action(character, quest)
        return unless quest["complete_action"]
        use_action_event(character, quest["complete_action"].to_i, quest["complete_action_params"].to_i)
      end
    end
  end
end  
