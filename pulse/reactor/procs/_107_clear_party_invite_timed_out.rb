#          id  107
# description  清理超时的组队邀请
#         api  .clear_party_invite_timed_out
#      params  tick:int
#        call  pulse
#     execute  vici

module Pulse
  class ClearPartyInviteTimedOutProc < PulseProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
