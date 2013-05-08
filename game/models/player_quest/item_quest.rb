class PlayerQuest < ActiveRecord::Base
  class << self
    def has_enough_items?(character, player_quests, item_id, stack)
      return true if character.item_count(item_id) - player_quests.inject(0){|sum, qst| qst.already_have_item_count(item_id) } >= stack.abs
      false
    end
  end

  def take_away_quest_items!(item_id, stack)
    character = self.character
    count = self.already_have_item_count(item_id)
    if count >= stack.abs
      self.update_item_quest!(item_id, stack)
    else
      self.update_item_quest!(item_id, -count)
      stack = count + stack
    end
  end

  def gain_quest_items!(item_id, stack)
    count = self.need_item_count(item_id)
    if count >= stack
      self.update_item_quest!(item_id, stack)
    else
      self.update_item_quest!(item_id, stack-count)
      stack = stack - count
    end
  end

  def update_progress
    character = self.character
    items = self.quest_items
    items.each do |item_id|
      count = character.item_count(item_id)
      increase_count(item_id, count)
    end
  end

  def need_item_count(item_id)
    return 0 if quest.nil?
    each_objective.inject(0){|sum, i|
      if quest["objective#{i}_item"] == item_id and quest["objective#{i}_amount"].to_i > self.send("objective#{i}_progress").to_i and quest["objective#{i}_type"].to_i != Vici::QuestObjective::USE
        sum += quest["objective#{i}_amount"].to_i - self.send("objective#{i}_progress").to_i
      end
      sum
    }
  end

  def need_use_item_count(item_id)
    each_objective.inject(0){|sum, i|
      if quest["objective#{i}_item"] == item_id and quest["objective#{i}_amount"].to_i > self.send("objective#{i}_progress").to_i and quest["objective#{i}_type"].to_i == Vici::QuestObjective::USE
        sum += quest["objective#{i}_amount"].to_i - self.send("objective#{i}_progress").to_i
      end
      sum
    }
  end

  def already_have_item_count(item_id)
    each_objective.inject(0){|sum, i|
      if quest["objective#{i}_item"].to_i == item_id and quest["objective#{i}_type"] != Vici::QuestObjective::USE
        sum += self.send("objective#{i}_progress")
      end
      sum
    }
  end

  def already_have_use_item_count(item_id)
    each_objective.inject(0){|sum, i|
      if quest["objective#{i}_item"].to_i == item_id and quest["objective#{i}_type"] == Vici::QuestObjective::USE
        sum += self.send("objective#{i}_progress")
      end
      sum
    }
  end

  def quest_items
    each_objective.collect{|i| 
      quest["objective#{i}_item"] if quest["objective#{i}_type"].to_i != Vici::QuestObjective::USE
    }.compact
    #[quest['objective1_item'],quest['objective2_item'],quest['objective3_item'],quest['objective4_item']]
  end

  def quest_use_items
    each_objective.collect{|i| 
      quest["objective#{i}_item"] if quest["objective#{i}_type"].to_i == Vici::QuestObjective::USE
    }.compact
  end

  def update_use_item_quest!(item_id)
    each_objective.each do |i|
      if quest["objective#{i}_item"] == item_id and self.send("objective#{i}_progress").to_i < quest["objective#{i}_amount"].to_i and quest["objective#{i}_type"].to_i == Vici::QuestObjective::USE
        self.send("objective#{i}_progress=", self.send("objective#{i}_progress") + 1)
      end     
    end
    save!
  end

  def update_item_quest!(item_id, stack)
    return if stack == 0
    stack > 0 ? increase_count(item_id, stack) : decrease_count(item_id,stack)
  end

  def increase_count(item_id, stack)
    each_objective.each do |i|
      if quest["objective#{i}_item"].to_i == item_id and self.send("objective#{i}_progress").to_i < quest["objective#{i}_amount"].to_i
        if quest["objective#{i}_amount"].to_i - self.send("objective#{i}_progress").to_i > stack
          self.send("objective#{i}_progress=", self.send("objective#{i}_progress").to_i + stack) 
        else
          stack = quest["objective#{i}_amount"] - self.send("objective#{i}_progress").to_i
          self.send("objective#{i}_progress=",  self.send("objective#{i}_progress").to_i+quest["objective#{i}_amount"].to_i-self.send("objective#{i}_progress").to_i)
        end
      end
    end
    save!
  end

  def decrease_count(item_id, stack)
    each_objective.each do |i|
      if quest["objective#{i}_item"].to_i == item_id and self.send("objective#{i}_progress").to_i >= stack.abs
        self.send("objective#{i}_progress=", self.send("objective#{i}_progress").to_i + stack)        
        self.send("objective#{i}_progress=", 0) if self.send("objective#{i}_progress").to_i < 0
      else
        self.send("objective#{i}_progress=", self.send("objective#{i}_progress").to_i + stack)        
        self.send("objective#{i}_progress=", 0) if self.send("objective#{i}_progress").to_i < 0
        stack = self.send("objective#{i}_progress").to_i + stack
      end
    end
    save!
  end
end
