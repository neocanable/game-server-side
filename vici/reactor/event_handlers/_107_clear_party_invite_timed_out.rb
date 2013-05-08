#          id  107
# description  清理超时的组队邀请
#         api  .clear_party_invite_timed_out
#      params  tick:int
#        call  pulse
#     execute  vici

module Vici
  class ClearPartyInviteTimedOutEventHandler < ViciEventHandler
    def execute(event)
      tick = event.tick
      raise "Overwrite me!"
    end
  end
end
