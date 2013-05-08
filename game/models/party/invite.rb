class Party < ActiveRecord::Base
  class << self
    def create_invite(character, target_character)
      party = character.current_party
      raise BadTargetError if target_character == character
      raise AlreadyInPartyError if target_character.party
      raise PartyIsFullError if party and party.number_of_members >= Vici::PARTY_MAX_MEMBERS
      raise PlayerIsBusyError if target_character.has_other_invite? 
      raise NotPartyLeaderError if character.party and character.party.leader_id != character.id
      invite = PartyInviteRequest.create :leader_id => character.id, :target_id => target_character.id, :elapsed => Time.now.to_i
    end

    def decline_invite(invite_id)
      invite = PartyInviteRequest.find_by_id(invite_id)
      raise "InvalidPartyInviteRequestError" unless invite
      invite.destroy
    end
  end
end
