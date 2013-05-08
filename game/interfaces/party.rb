module Vici
  class PartyInterface < Interface
    class << self
      def invite_character(character, target_character)
        begin 
          invite = Party.create_invite(character, target_character)
          party_invite_request(invite.id, character.id, character.name, target_character.account_id)
        rescue Exception => e
          ErrorInterface.post_error(e, character.account_id)
        end
      end

      def decline_invite(invite_id)
        invite = PartyInviteRequest.find_by_id(invite_id)
        invite.destroy
        #party_invite_declined(character_id, character.name, account_id)
      end

      def accept_invite(invite_id, character)
        invite = PartyInviteRequest.find_by_id(invite_id)
        raise "InvalidPartyInviteRequestError" unless invite
        leader = Character.find_by_id(invite.leader_id)
        raise AlreadyInPartyError if character.party

        if party = leader.party
          party.add_member!(character)
          character_join_party_event(character, party)
        else
          party = Party.init_party(leader, character)
          party_created_event(party, leader, character)
        end
        invite.destroy
      end

      def leave_party(character)
        party        = character.party
        leader_leave = party.leader_id == character.id
        if party.to_disband?
          party_diband_event(party)
          party.disband
        else
          party.member_leave(character)
          character_leave_party_event(character, party, leader_leave)  
        end
      end

      def party_uninvite(character, party, target_character)
        raise NotPartyLeaderError unless character.id == party.leader_id
        if party.to_disband?
          party_diband_event(party)
          party.disband
        else
          party.member_leave(target_character)
          character_leave_party_event(target_character, party)
        end
      end


      def set_leader(leader, new_leader_id)
        party = leader.party
        raise NotPartyLeaderError if leader.id != party.leader_id

        party.leader_id = new_leader_id
        party.save!

        party_leader_changed_event(party)
      end

      def delete_time_out_invite
        delete_sql = "DELETE FROM `party_invite_requests` WHERE `elapsed`< #{Time.now.to_i - Vici::PARTY_INVITE_TIMEOUT}"
        Party.connection.execute(delete_sql)
      end

    end
  end
end  
