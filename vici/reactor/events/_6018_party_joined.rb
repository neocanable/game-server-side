#          id  6018
# description  玩家加入组队
#         api  party.party_joined
#      params  party_id account_id
#        call  vici
#     execute  game_center

module Vici
  class PartyJoinedEvent < ViciEvent
    include Singleton

    attr_accessor :party_id
    attr_accessor :account_id


    def dump
      _event_id = 6018
      Packet.pack([_event_id, @party_id, @account_id])
    end

    private
      def handler
        PartyJoinedEventHandler.instance
      end
  end
end
