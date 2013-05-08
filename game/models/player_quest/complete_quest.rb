class Character < ActiveRecord::Base
  # 完成任务
  def complete_quest(quest_id)
    quest = static_quest(quest_id)
    player_quest = player_quests.first(:conditions => ["quest_id=?", quest_id])    
    if player_quest
      raise InvalidQuestError if player_quest.nil?
      raise CanNotCompleteQuestError unless player_quest.has_finished?
    else
      raise InvalidQuestError unless can_accept_quest?(quest_id)
      raise CanNotCompleteQuestError unless PlayerQuest.is_null_quest?(quest)
    end
    
    complete_quest_items(quest, selectd_option)
    complete_quest_xp(quest)
    complete_quest_money(quest)
    take_away_quest_items(quest)

    destroy_progress_and_complete(player_quest, quest, character)

    #can_do_quests(character)

    follow_quest = follow_quest(quest, character)

    next_quest_id = follow_quest.nil? ? nil : follow_quest["id"].to_i
    [quest_id, next_quest_id]
  end

  # 完成任务送任务物品 
  def complete_quest_items(quest_id, selectd_option)
    quest = static_quest(quest_id)        
    rewards = quest_rewards(quest, selectd_option)
    rewards.collect do |item_id, amount|
      #vici_info.quest_reward_item(quest["id"].to_i, character.id, character.level, character.profession, amount, item_id)
      Container.give_items_to_assign_player(item_id, amount, self.id)
    end
  end

  # 完成任务送经验
  def complete_quest_xp(quest_id)
    quest = static_quest(quest_id)          
    #vici_info.quest_reward_xp(quest["id"].to_i, character.id, character.level, character.profession, quest["gain_xp"].to_i)
    gain_xp(quest["gain_xp"].to_i)
    quest["gain_xp"].to_i
  end

  # 完成任务送钱
  def complete_quest_money(quest_id)
    #vici_info.quest_reward_money(quest["id"].to_i, character.id, character.level, character.profession, quest["gain_money"].to_i)
    quest = static_quest(quest_id)
    earn_money!(quest["gain_money"].to_i)
    #    post_target_event(character.account_id, Vici::EventType::PLAYER_MONEY_GAIN, quest["gain_money"].to_i)
    #    post_target_event(character.account_id, Vici::EventType::PLAYER_MONEY, character.money)
    quest["gain_money"].to_i
  end

  # 完成任务拿走任务物品
  def take_away_quest_items(quest_id, character)
    quest = static_quest(quest_id)                   
    container = character.quest_container
    each_objective.collect do |i|
      if quest["objective#{i}_type"] == Vici::QuestObjective::ACQUIRE or quest["objective#{i}_type"] == Vici::QuestObjective::COURIER
        container.take_away_stacking_items(quest["objective#{i}_item"].to_i, quest["objective#{i}_amount"].to_i)
        #vici_info.turn_in_quest(quest["id"].to_i, character.id, character.level, character.profession, quest["objective#{i}_amount"], quest["objective#{i}_item"].to_i)
      end
    end
  end

  def follow_quest(quest, character)
    follow_quests = PlayerQuest.next_quests(quest)
    follow_quests.collect { |q|
      if q["start_npc"].to_i == quest["end_npc"].to_i
        q if character.can_accept_quest?(q)
      end
    }.compact.first
  end

  # 任务物品奖励
  def quest_rewards(quest, selectd_option)
    each_reward.collect{|num|
      check_quest_rewards(quest, selectd_option, num) ? [quest["reward#{num}"], quest["reward#{num}_amount"]] : nil
    }.compact
  end

  def check_quest_rewards(quest, selectd_option, num)
    #quest["reward#{num}"] and quest["reward#{num}_amount"] and (quest["reward#{num}_is_option"] or (selectd_option == num and quest["reward#{num}_is_option"]))
    if quest["reward#{num}_is_option"] and selectd_option == num
      true
    elsif quest["reward#{num}"] and quest["reward#{num}_is_option"].nil?
      true
    else
      false
    end
  end

  def destroy_progress_and_complete(player_quest, quest, character)
    PlayerCompletedQuest.create :character_id => character.id, :quest_id => quest["id"].to_i
    player_quest.destroy if player_quest
  end
end
