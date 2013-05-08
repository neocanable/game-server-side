class Character < ActiveRecord::Base
  belongs_to :party

  def current_party
    Party.find_by_leader_id(self.id)
  end

  def has_other_invite?
    PartyInviteRequest.find_by_target_id(self.id)
  end

end
