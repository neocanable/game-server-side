#          id  6003
# description  发起组队邀请
#         api  party.party_invite_player
#      params  character_id target_character_id target_character_name
#        call  game_center
#     execute  vici

module Vici
  class PartyInvitePlayerEventHandler < ViciEventHandler
    def execute(event)
      character_id = event.character_id
      target_character_id = event.target_character_id
      target_character_name = event.target_character_name
      raise "Overwrite me!"
    end
  end
end
