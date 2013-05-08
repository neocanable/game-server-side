#          id  6010
# description  队长变化
#         api  party.party_update_leader
#      params  party_id leader_character_id leader_name
#        call  vici
#     execute  game_center

module Vici
  class PartyUpdateLeaderEvent < ViciEvent
    include Singleton

    attr_accessor :party_id
    attr_accessor :leader_character_id
    attr_accessor :leader_name


    def dump
      _event_id = 6010
      Packet.pack([_event_id, @party_id, @leader_character_id, @leader_name])
    end

    private
      def handler
        PartyUpdateLeaderEventHandler.instance
      end
  end
end
