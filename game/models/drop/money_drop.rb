class Drop
  class << self
    def money_drop(npc_id)
       level = static_npc(npc_id)['level']
       type  = static_npc(npc_id)['classsification']
       coefficient = level_coefficient(level)  # 等级系数
       money = rand_range(coefficient['k_low']*level,coefficient['k_high']*level)
       money = money*4 if type.to_i == Vici::NpcClassification::ELITE 
       money = money*21 if type.to_i == Vici::NpcClassification::BOSS
       money
    end
  
    def party_money_drop(party, money, character)
      split_money = money/party.same_scene_characters(character).size
      party.same_scene_characters(character).each do |memeber|
        post_party_in_sence_event(party, memeber, Vici::EventType::LOOT_MONEY, memeber.id, split_money)
        give_money_to_member(memeber, money)
      end
    end
  
    def give_money_to_member(character, money)
      character.money += money
      character.save
  
      post_target_event(character.account_id, Vici::EventType::PLAYER_MONEY_GAIN, money)
      post_target_event(character.account_id, Vici::EventType::PLAYER_MONEY, character.money)
    end
  
    # 得到计算金钱的系数
    def level_coefficient(level)
      find_range(:MONEY_DROP,'level_min','level_max',level)
    end
  
  	# Vici::Code.find_range(:MONEY_DROP,'level_min','level_max',20)
    def find_range(name,column_min,column_max,value)
      table = Vici.const_get(name)
      (table.select{|k,v| v[column_min] <= value && v[column_max] >= value}).map{|v| v[1] }.first
    end
  end
end
