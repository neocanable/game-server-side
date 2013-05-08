module Vici
  class AlbumInterface < Interface
    class << self
    
      def list(character, page)
        ids = album_index(page + 1).collect{|id| id }
        cards = Album.find(:all, :conditions => ["card_num in (?)", ids]).collect{|c| c.card_num }
        arr = ids.collect{|num|
          if cards.include?(num)
            card = Album.first(:conditions => ["card_num=? AND character_id=?", num, character.id])
            card_item = AlbumEvent::Card.new
            card_item.card_index = card.card_num
            card_item.gain_time  = card.gain_time
            card_item
          else
            nil
          end
        }.compact
        album(page, arr, character.account_id)
      end
     
      private
    
      # 计算卡片的号码
      def album_index(page)
        page = 1 if page <= 0
        if page == 1
          0..6
        else
          (Vici::CARD_NUMS_IN_FIRST_PAGE + (page - 2)*Vici::CARD_NUMS_PER_PAGE)..(Vici::CARD_NUMS_IN_FIRST_PAGE + (page-1)*Vici::CARD_NUMS_PER_PAGE - 1)
        end
      end

    end
  end
end  
