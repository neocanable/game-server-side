require File.expand_path(File.dirname(__FILE__) + "/player_quest/character_quest")
require File.expand_path(File.dirname(__FILE__) + "/player_quest/character_complete_quest")
require File.expand_path(File.dirname(__FILE__) + "/player_quest/gossip_quest")
require File.expand_path(File.dirname(__FILE__) + "/player_quest/npc_quest")
require File.expand_path(File.dirname(__FILE__) + "/player_quest/item_quest")
require File.expand_path(File.dirname(__FILE__) + "/player_quest/party_quest")

class PlayerQuest < ActiveRecord::Base
  belongs_to :character

  def has_finished?
    return true if self.is_null_quest?
    (1..Vici::QUEST_MAX_OBJECTIVES).each do |i|
      next if quest["objective#{i}_type"].nil?
      return false if (self.send("objective#{i}_progress").to_i < quest["objective#{i}_amount"].to_i)
    end
    true 
  end

  def is_null_quest?
    self.class.is_null_quest?(quest)
  end
  
  def next_quests
    self.class.next_quests(quest)
  end

  def has_courier?
    each_objective.collect{|i| quest["objective#{i}_type"].to_i }.include?(Vici::QuestObjective::COURIER)
  end

  def quest
    Vici::Code.first(:QUEST, 'id', self.quest_id)
  end

#-----------------------------------------------------------ClassMethod
  def self.is_null_quest?(quest)
    (1..Vici::QUEST_MAX_OBJECTIVES).each do |i|
      return false unless quest["objective#{i}_type"].nil?
    end   
    true  
  end

  def self.next_quests(quest)
    Vici::Code.find(:QUEST, 'prev_quest', quest["id"].to_i).collect{|v| v }
  end
  

  private
    
    def each_objective
      (1..Vici::QUEST_MAX_OBJECTIVES)
    end

    def each_reward
      (1..Vici::QUEST_MAX_REWARDS)
    end



end
