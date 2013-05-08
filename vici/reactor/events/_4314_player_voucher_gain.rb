#          id  4314
# description  玩家获得银票
#         api  player.player_voucher_gain
#      params  voucher_gained:int voucher
#        call  vici
#     execute  client

module Vici
  class PlayerVoucherGainEvent < ViciEvent
    include Singleton

    attr_accessor :voucher_gained
    attr_accessor :voucher
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      _event_id = 4314
      Packet.pack([_event_id, @voucher_gained, @voucher, @_channel_id, @_account_id])
    end

    private
      def handler
        PlayerVoucherGainEventHandler.instance
      end
  end
end
