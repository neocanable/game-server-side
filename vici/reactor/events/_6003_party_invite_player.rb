#          id  6003
# description  发起组队邀请
#         api  party.party_invite_player
#      params  character_id target_character_id target_character_name
#        call  game_center
#     execute  vici

module Vici
  class PartyInvitePlayerEvent < ViciEvent
    include Singleton

    attr_accessor :character_id
    attr_accessor :target_character_id
    attr_accessor :target_character_name

    def load(packet, connection = nil)
      @connection = connection
      @packet = packet
      data = packet.unpack
      @character_id = data[1]
      @target_character_id = data[2]
      @target_character_name = data[3]
    end


    private
      def handler
        PartyInvitePlayerEventHandler.instance
      end
  end
end
