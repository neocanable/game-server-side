#          id  6607
# description  取附件
#         api  mail.mail_take_item
#      params  mail_id attachment_id
#        call  client
#     execute  vici

module Vici
  class MailTakeItemEvent < ViciEvent
    include Singleton

    attr_accessor :mail_id
    attr_accessor :attachment_id
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
      @mail_id = data[1]
      @attachment_id = data[2]
      @_tick = data[3]
      @_role_id = data[4]
      @_zone_id = data[5]
      @_scene_id = data[6]
      @_account_id = data[7]
      @_character_id = data[8]
      @_party_id = data[9]
      @_guild_id = data[10]
    end


    private
      def handler
        MailTakeItemEventHandler.instance
      end
  end
end
