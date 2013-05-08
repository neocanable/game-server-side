#          id  6024
# description  解散组队
#         api  party.party_disbanded
#      params  party_id
#        call  vici
#     execute  game_center

module Vici
  class PartyDisbandedEvent < ViciEvent
    include Singleton

    attr_accessor :party_id


    def dump
      _event_id = 6024
      Packet.pack([_event_id, @party_id])
    end

    private
      def handler
        PartyDisbandedEventHandler.instance
      end
  end
end
