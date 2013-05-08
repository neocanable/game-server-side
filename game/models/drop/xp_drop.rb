class Drop
  class << self
    # 经验掉落
    def exp_drop(npc_id, character)
      npc = static_npc(npc_id)
      xp  = npc["level"].to_i*5 + 45
      #value_diff = npc['level'].to_i - character.level
      #corrected_value = corrected_value_table(value_diff)
      #exp = 0
      #if npc['classsification'].to_i == Vici::NpcClassification::NORMAL
      #  exp = (npc['level']*2 + 7)*corrected_value.to_i
      #elsif npc['classsification'].to_i == Vici::NpcClassification::ELITE
      #  exp = (npc['level']*5 + 8)*corrected_value.to_i
      #elsif npc['classsification'].to_i == Vici::NpcClassification::BOSS
      #  exp = (npc['level']*9 + 9)*corrected_value.to_i
      #end
      xp
    end
  
  
    # 分经验给一个组队的成员
    # killer : 杀死怪物的人
    # party  : 队伍
    # npc    : 怪物
    # exp    : 怪物掉落的经验
    # character: 需要分经验的角色
    def party_member_exp_drop(killer, party, npc, exp, character)
      # 如果没有在场景内的队员，那么就没TA什么事儿
      #return unless is_in_scene?(killer, character.scene_id) 
      return unless killer.in_same_scene?(character)
      value_diff = npc['level'].to_i - character.level
      # 等级差距超过15级的时候就不给经验了
      return if value_diff < -15
      corrected_value = corrected_value_table(value_diff)
      numbers = party.characters.size
      levels = party.characters.collect{|member| member.level }
      max = levels.max
      min = levels.min
     # （怪物提供的经验值×等级修正）×(队伍人数/（队伍人数+1））/（队伍中等级最高者-当前者的等级+1）)
      xp =((exp*corrected_value)*(numbers.to_f/(numbers + 1).to_f))/(max-min+1)
      xp
    end
  
    # 随机函数,获取某个范围内的随机数值
    def rand_range(min, max)
      min + rand(max - min)
    end
  
    # 计算经验修正值
    def corrected_value_table(key)
      v = {-5 => 0.3, -4 => 0.5, -3 => 0.7, -2 => 0.8, -1 => 0.9, 0 => 1, 1 => 1.05, 2 => 1.1, 3 => 1.15, 4 => 1.2, 5 => 1.25, 6 => 130, 7 => 1.35, 8 => 1.4, 9 => 1.45}[key]
      v = 1.5 if key >= 10
      v = 0 if key <= -6
      v
    end
  end
end
