#          id  6006
# description  拒绝组队邀请
#         api  party.party_decline_invite
#      params  request_id
#        call  client
#     execute  vici

module Vici
  class PartyDeclineInviteEventHandler < ViciEventHandler
    def execute(event)
      request_id = event.request_id
      raise "Overwrite me!"
    end
  end
end
