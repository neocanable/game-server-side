#  party_invite_request(request_id, leader_character_id, leader_name, _account_id = nil, _channel_id = 5)
#  party_invite_declined(character_id, character_name, _account_id = nil, _channel_id = 5)
#  party_new_member_joined(character_id, character_name, _account_id = nil, _channel_id = 5)
#  party_member_leaved(character_id, character_name, _account_id = nil, _channel_id = 5)
#  party_leader_changed(leader_id, leader_name, _account_id = nil, _channel_id = 5)

module Vici
  class << PartyInvitePlayerEventHandler.instance
    def execute(event)
      character_id = event.character_id
      target_character_id = event.target_character_id
      target_character_name = event.target_character_name

      character        = Character.find_by_id(character_id)
      target_character = Character.find_by_id(target_character_id)

      PartyInterface.invite_character(character, target_character)
    end
  end

  class << PartyUninviteEventHandler.instance
    def execute(event)
      character_id = event.character_id
      player_id    = event._character_id
      
      target_character = Character.find_by_id(character_id)
      character        = Character.find_by_id(player_id)
      raise 'NotSamePartyError' unless target_character.party_id == character.party_id
      
      PartyInterface.party_uninvite(character, character.party, target_character)
    end
  end

  class << PartyAcceptInviteEventHandler.instance
    def execute(event)
      request_id   = event.request_id
      character_id = event._character_id
      account_id   = event._account_id
      character    = Character.find_by_id(character_id)

      PartyInterface.accept_invite(request_id, character)
    end
  end


  class << PartyDeclineInviteEventHandler.instance
    def execute(event)
      request_id = event.request_id
      character_id = event._character_id
      account_id   = event._account_id     

      character = Character.find_by_id(character_id)
      PartyInterface.decline_invite(request_id)
    end
  end

  class << PartyLeaveEventHandler.instance
    def execute(event)
      character_id = event._character_id
      account_id   = event._account_id
      character    = Character.find_by_id(character_id)

      PartyInterface.leave_party(character) 
    end
  end

  class << PartySetLeaderEventHandler.instance
    def execute(event)
      character_id = event.character_id
      leader_id    = event._character_id
      leader       = Character.find_by_id(leader_id)

      PartyInterface.set_leader(leader, character_id)
    end
  end

  class << ClearPartyInviteTimedOutEventHandler.instance
    def execute(event)
      tick = event.tick
      PartyInterface.delete_time_out_invite
    end
  end
end
