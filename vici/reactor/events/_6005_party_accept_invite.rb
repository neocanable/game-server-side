#          id  6005
# description  接受组队邀请
#         api  party.party_accept_invite
#      params  request_id
#        call  client
#     execute  vici

module Vici
  class PartyAcceptInviteEvent < ViciEvent
    include Singleton

    attr_accessor :request_id
    attr_accessor :_tick
    attr_accessor :_role_id
    attr_accessor :_zone_id
    attr_accessor :_scene_id
    attr_accessor :_account_id
    attr_accessor :_character_id
    attr_accessor :_party_id
    attr_accessor :_guild_id

    def load(packet, connection = nil)
      @connection = connection
      @packet = packet
      data = packet.unpack
      @request_id = data[1]
      @_tick = data[2]
      @_role_id = data[3]
      @_zone_id = data[4]
      @_scene_id = data[5]
      @_account_id = data[6]
      @_character_id = data[7]
      @_party_id = data[8]
      @_guild_id = data[9]
    end


    private
      def handler
        PartyAcceptInviteEventHandler.instance
      end
  end
end
