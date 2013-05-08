#          id  6702
# description  集卡册
#         api  album.album
#      params  page card[card_index gain_time:str]
#        call  vici
#     execute  client

module Vici
  class AlbumEvent < ViciEvent
    include Singleton

    attr_accessor :page
    class Card
      attr_accessor :card_index
      attr_accessor :gain_time
    end
    attr_accessor :cards
    attr_accessor :_channel_id
    attr_accessor :_account_id


    def dump
      cards = @cards.collect do |card|
        [card.card_index, card.gain_time]
      end
      _event_id = 6702
      Packet.pack([_event_id, @page, cards, @_channel_id, @_account_id])
    end

    private
      def handler
        AlbumEventHandler.instance
      end
  end
end
