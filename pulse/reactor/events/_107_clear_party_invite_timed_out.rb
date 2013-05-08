#          id  107
# description  清理超时的组队邀请
#         api  .clear_party_invite_timed_out
#      params  tick:int
#        call  pulse
#     execute  vici

module Pulse
  class ClearPartyInviteTimedOutEvent < PulseEvent
    include Singleton

    attr_accessor :tick


    def dump
      _event_id = 107
      Packet.pack([_event_id, @tick])
    end

    private
      def handler
        ClearPartyInviteTimedOutEventHandler.instance
      end
  end
end
