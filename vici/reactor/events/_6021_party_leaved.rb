#          id  6021
# description  玩家离开组队
#         api  party.party_leaved
#      params  party_id account_id
#        call  vici
#     execute  game_center

module Vici
  class PartyLeavedEvent < ViciEvent
    include Singleton

    attr_accessor :party_id
    attr_accessor :account_id


    def dump
      _event_id = 6021
      Packet.pack([_event_id, @party_id, @account_id])
    end

    private
      def handler
        PartyLeavedEventHandler.instance
      end
  end
end
