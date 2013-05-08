class PlayerQuest < ActiveRecord::Base
  def update_gossip_quest!(gossip_id)
    each_objective.each do |i|
      if quest["objective#{i}_gossip"] == gossip_id and self.send("objective#{i}_progress").to_i < quest["objective#{i}_amount"].to_i and quest["objective#{i}_type"].to_i != Vici::QuestObjective::USE
        self.send("objective#{i}_progress=", self.send("objective#{i}_progress") + 1)
      end     
    end
    save!
  end

  def quest_gossips
    [quest['objective1_gossip'],quest['objective2_gossip'],quest['objective3_gossip'],quest['objective4_gossip']].compact
  end
end
