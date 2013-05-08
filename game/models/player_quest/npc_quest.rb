class PlayerQuest < ActiveRecord::Base
  def need_npc_count(npc_id)
    each_objective.inject(0){|sum, i|
      if quest["objective#{i}_npc"] == npc_id and quest["objective#{i}_amount"].to_i > self.send("objective#{i}_progress")
        sum += quest["objective#{i}_amount"].to_i - self.send("objective#{i}_progress")
      end   
      sum      
    }
  end

  def update_npc_quest!(npc_id)
    each_objective.each do |i|
      if quest["objective#{i}_npc"].to_i == npc_id and self.send("objective#{i}_progress").to_i < quest["objective#{i}_amount"].to_i
        self.send("objective#{i}_progress=", self.send("objective#{i}_progress").to_i+1)
      end
    end
    save!
  end
end
