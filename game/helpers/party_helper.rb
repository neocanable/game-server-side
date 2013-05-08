module Vici
  module InterfaceHelper

    def character_join_party_event(character, party)
      party.characters.each do |member|
        party_new_member_joined(member.id, member.name, character.account_id) if member != character
        party_new_member_joined(character.id, character.name, member.account_id) if member != character
      end       
      party_joined(party.id, character.account_id)
      party_leader_changed_event(party)
    end

    # 玩家离开组队
    def character_leave_party_event(character, party, leader_changed = false)
      party.characters.each do |member|
        party_member_leaved(character.id, character.name, member.account_id)
        party_leader_changed_event(party)  if leader_changed
      end
      party_member_leaved(character.id, character.name, character.account_id)
      party_leaved(party.id, character.account_id)
    end

    def party_diband_event(party)
      party.characters.each do |member|
        party_leaved(party.id, member.account_id)
        party.characters.each do |character|
          party_member_leaved(character.id, character.name, member.account_id) if member != character
        end
      end
    end

    def party_leader_changed_event(party)
      leader = party.leader
      party_update_leader(party.id, leader.id, leader.name)
    end

    def party_created_event(party, leader, member)
      party_created(party.id, leader.account_id, member.account_id)
        
      party_new_member_joined(leader.id, leader.name, member.account_id)
      party_new_member_joined(member.id, member.name, leader.account_id)  
      party.characters.each do |character|
        party_leader_changed_event(party)
      end
    end

  end
end  

