module Vici
  class MallInterface < Interface
    class << self
    
      # 翻页
      def list(character, tab, page)
        mall_items, pages, page, tab = Mall.list(page, tab)
        mall_list_event(character, mall_items, tab-1, page-1, pages)
      end
    
      # 买东西
      def buy_item(mall_item_id, quantity, currency, buyer, to_player = nil)
        mall_item = Mall.find_by_id(mall_item_id)
        Mail.transaction do 
          mall_item.spend_money(buyer, quantity, currency)
          to_player.nil? ? give_item_to_self(mall_item, quantity, buyer) : give_item_to_others(mall_item, quantity, to_player)
        end
        player_diamond(buyer.account.diamond, buyer.account_id)
      end
    
      def give_item_to_self(mall_item, quantity, buyer)
        begin
          character_gets_items_event(mall_item.static_item_id, quantity*mall_item.stack, buyer)
        rescue Exception => e
          mail = Mail.create :subject => "购买", :character_id => buyer.id, :sender_id => buyer.id 
          MailAttachment.create :item_id => mall_item.static_item_id, :quantity => mall_item.stack
          update_pending_mail(buyer.account_id)
        end
      end
    
      def give_item_to_others(mall_item, quantity, other, character = nil)
        mail = Mail.create :title => "赠送", :character_id => other.id, :sender_id => character.id
        MailAttachment.create :item_id => mall_item.static_item_id, :quantity => mall_item.stack, :mail_id => mail.id
        update_pending_mail(other.account_id)
      end
 
    end
  end
end  

