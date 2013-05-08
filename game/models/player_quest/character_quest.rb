class Character < ActiveRecord::Base
  has_many :player_quests
  has_many :player_completed_quests

  def can_do_quests
    table = Vici.const_get(:QUEST)
    completed_quests = PlayerCompletedQuest.find(:all, :conditions => ["character_id=?", self.id]).collect{|com_quest| com_quest.quest_id }
    already_quests   = PlayerQuest.find(:all, :conditions => ["character_id=?", self.id]).collect{|player_quest| player_quest.quest_id }
    quests = table.select{|k,v| 
      next if v["level"].to_i > self.level or completed_quests.include?(k.to_i) or already_quests.include?(k.to_i)
      self.can_accept_quest?(v["id"]) ? v : nil 
    }.compact
  end

  def abandon_quest(quest_id)
    player_quest = PlayerQuest.first(:conditions => ["character_id=? AND quest_id=?", self.id, quest_id])
    raise InvalidQuestError if player_quest.nil?
    player_quest.destroy
  end

  def accept_quest(quest_id)
    quest = static_quest(quest_id)

    raise PlayerQuestIsFullError if self.player_quests.count >= Vici::PLAYER_MAX_QUEST
    raise CanNotAcceptQuestError unless self.can_accept_quest?(quest_id)
    player_quest = PlayerQuest.create :quest_id => quest_id, :character_id => self.id,:objective1_progress => 0,:objective2_progress => 0, :objective3_progress => 0, :objective4_progress => 0

    player_quest.update_progress
    player_quest
  end

  # 是否能接受任务
  def can_accept_quest?(quest_id)
    quest = static_quest(quest_id)         
    player_quest = get_with_quest_id(quest['id'])
    unless PlayerQuest.is_null_quest?(quest)
      return false if player_quest  # 已经接受了这个任务
    end

    # 必须查，不然出脏数据
    olders = PlayerCompletedQuest.find(:all, :conditions => ["character_id=?", self.id]).collect{|e| e.quest_id }
    if profession_satisfy?(quest) and get_completed_quest(quest["id"]).nil? and level_and_prev_quest_satisfy?(quest, olders)
      return true if daily_satisfy?(quest)
    end
    false
  end

  def need_item_player_quests(item_id)
    player_quests.collect{|player_quest|
      player_quest.quest_items.include?(item_id) ? player_quest : nil
    }.compact
  end

  # 根据quest_id找到一个任务
  def get_with_quest_id(quest_id)
    player_quests.first(:conditions => ["quest_id=?", quest_id])
  end

  def get_completed_quest(quest_id)
    player_completed_quests.first(:conditions => ["quest_id=?", quest_id])
  end

  def need_item_unfinish_player_quests(item_id)
    player_quests.collect{|player_quest|
       player_quest.need_item_count(item_id) > 0 ? player_quest : nil   
    }.compact
  end

  def need_item_count(item_id)
    quests = PlayerQuest.find(:all, :conditions => ["character_id=?", self.id])
    quests.inject(0){|sum, player_quest|
      sum += player_quest.need_item_count(item_id)
    }
  end

  def need_npc_unfinish_player_quests(npc_id)
    player_quests.collect{|player_quest|
      player_quest.need_npc_count(npc_id) > 0 ? player_quest : nil   
    }.compact
  end

  def need_gossip_unfinish_player_quests(gossip_id)
    player_quests.collect{|player_quest|
      player_quest.quest_gossips.include?(gossip_id) ? player_quest : nil
    }.compact
  end

  def need_use_item_quests(item_id)
    player_quests.collect{|player_quest|
      player_quest.need_use_item_count(item_id) > 0 ? player_quest : nil
    }.compact
  end

  def quest_container
    containers.first(:conditions => ["container_type=?", Vici::ContainerType::BAG_QUEST])
  end

  # 玩家进行中的任务
  def doing_quests
    quest_ids = self.player_quests.collect{|e| e.quest_id }   
    quests = quest_ids.collect{|quest_id| Vici::Code.first(:QUEST, 'id', quest_id) }.compact
  end



  private

    # 可以接任务的npc
    def quest_start_npcs
      can_do_quests.collect{|quest| quest['start_npc'] }
    end

    # 人物结束npc
    def quest_end_npcs
      doing_quests.collect{|quest| quest['end_npc'] }
    end
    
    # 可以对话的npc
    def quest_gossip_npcs
      doing_quests.collect{|quest|
        each_objective.collect{|i| quest["objective#{i}_gossip"] ? quest["objective#{i}_npc"] : nil }.compact
      }.flatten
    end

    # 任务职业
    def profession_satisfy?(quest)
      quest["profession"] == self.profession or quest["profession"].nil?
    end
    
    # 任务等级和前置任务
    def level_and_prev_quest_satisfy?(quest, olders)
      quest["level"].to_i <= self.level and (quest["prev_quest"].nil? or olders.include?(quest["prev_quest"].to_i)) 
    end

    # 日常任务
    def daily_satisfy?(quest)
      quest["repeat_daily"].nil? or quest["repeat_daily"].to_i > today_do_quest_count(quest)
    end

    # 日常任务，今天完成了多少次
    def today_do_quest_count(quest)
      self.player_completed_quests.count(
        :conditions => ["quest_id=? AND updated_at > ?",quest['id'], "#{Time.now.strftime('%Y-%m-%d')} 00:00:00"]
      )
    end
end
