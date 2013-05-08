#          id  6601
# description  发送邮件
#         api  mail.send_mail
#      params  target_character_name subject:str body:str money:int attachment[item_id quantity]
#        call  client
#     execute  vici

module Vici
  class SendMailEvent < ViciEvent
    include Singleton

    attr_accessor :target_character_name
    attr_accessor :subject
    attr_accessor :body
    attr_accessor :money
    class Attachment
      attr_accessor :item_id
      attr_accessor :quantity
    end
    attr_accessor :attachments
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
      @target_character_name = data[1]
      @subject = data[2]
      @body = data[3]
      @money = data[4]
      @attachments = data[5].collect do |arr|
      attachment = Attachment.new
      attachment.item_id = arr[0]
      attachment.quantity = arr[1]
      attachment
      end
      @_tick = data[6]
      @_role_id = data[7]
      @_zone_id = data[8]
      @_scene_id = data[9]
      @_account_id = data[10]
      @_character_id = data[11]
      @_party_id = data[12]
      @_guild_id = data[13]
    end


    private
      def handler
        SendMailEventHandler.instance
      end
  end
end
