#          id  107
# description  清理超时的组队邀请
#         api  .clear_party_invite_timed_out
#      params  tick:int
#        call  pulse
#     execute  vici

module Vici
  class ClearPartyInviteTimedOutEvent < ViciEvent
    include Singleton

    attr_accessor :tick

    def load(packet, connection = nil)
      @connection = connection
      @packet = packet
      data = packet.unpack
      @tick = data[1]
    end


    private
      def handler
        ClearPartyInviteTimedOutEventHandler.instance
      end
  end
end
