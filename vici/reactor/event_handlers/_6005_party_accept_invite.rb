#          id  6005
# description  接受组队邀请
#         api  party.party_accept_invite
#      params  request_id
#        call  client
#     execute  vici

module Vici
  class PartyAcceptInviteEventHandler < ViciEventHandler
    def execute(event)
      request_id = event.request_id
      raise "Overwrite me!"
    end
  end
end
