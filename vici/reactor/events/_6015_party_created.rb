#          id  6015
# description  玩家创建组队
#         api  party.party_created
#      params  party_id account1_id account2_id
#        call  vici
#     execute  game_center

module Vici
  class PartyCreatedEvent < ViciEvent
    include Singleton

    attr_accessor :party_id
    attr_accessor :account1_id
    attr_accessor :account2_id


    def dump
      _event_id = 6015
      Packet.pack([_event_id, @party_id, @account1_id, @account2_id])
    end

    private
      def handler
        PartyCreatedEventHandler.instance
      end
  end
end
