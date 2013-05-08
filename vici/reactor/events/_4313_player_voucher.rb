#          id  4313
# description  玩家银票
#         api  player.player_voucher
#      params  voucher
#        call  vici
#     execute  client

module Vici
  class PlayerVoucherEvent < ViciEvent
    include Singleton

    attr_accessor :voucher
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 4313
      Packet.pack([_event_id, @voucher, @_channel_id, @_account_id])
    end

    private
      def handler
        PlayerVoucherEventHandler.instance
      end
  end
end
