class Party < ActiveRecord::Base
  
  def change_leader(leader_id)
    self.leader_id = leader_id
  end

  def to_disband?
    self.number_of_members - 1 == 1
  end

  def disband
    characters.update_all(:party_id => nil)
    destroy
  end

  def leader
    Character.find_by_id(self.leader_id)
  end

  def member_leave(member)
    self.number_of_members -= 1
    member.party_id = nil
    leader_leave if member.id == self.leader_id
    if member.id == self.leader_id
      self.leader_id = self.characters.collect{|e| e == member ? nil : e.id  }.compact.min 
    end
    save!
    member.save!
  end

  # 分东西的顺序,这里已经将未在场景内的人去掉了
  def same_scene_characters(character)
    return characters if character.nil?    
    characters.collect{|member| 
      member.scene_id == character.scene_id ? member : nil
    }.compact
  end

  def add_member!(character)
    raise PartyIsFullError if self.number_of_members >= Vici::PARTY_MAX_MEMBERS
    character.party_id = self.id
    self.number_of_members += 1
    self.save!
    character.save!
  end

  def is_party_disband?
    self.number_of_members - 1 == 1
  end



  # 第一次创建队伍
  def self.init_party(leader, member)
    party = create(:leader_id => leader.id, :loot_method => Vici::LootMethod::FREE_FOR_ALL, :loot_threshold => Vici::LootThreshold::D, :number_of_members => 2)
    leader.party_id = party.id
    member.party_id = party.id
    leader.save!
    member.save!
    party
  end

  private
    def leader_leave
      PartyInviteRequest.delete_all(:leader_id => self.id)
    end

end
