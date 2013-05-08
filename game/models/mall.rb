class Mall < ActiveRecord::Base

  class << self
    def list(page, tab)
      if tabs.include?(tab+1)
        tab += 1
      else
        tab  = 1
        page = 0
      end
      count = Mall.count(:conditions => ["tab=?", tab])
      pages = count/Vici::MALL_ITEMS_PER_PAGE
      pages += 1 if count%Vici::MALL_ITEMS_PER_PAGE > 0
      
      page += 1
      page = pages if page > pages
      page = 1 if page <= 0 
      
      offset = page == 1 ? 1 : (page-1)*Vici::MALL_ITEMS_PER_PAGE
      mall_items = Mall.find(:all,:conditions => ["tab=?", tab],:offset => offset, :limit => Vici::MALL_ITEMS_PER_PAGE)   
      [mall_items, pages, page, tab]
    end
  
    private
      def tabs
        [Vici::MallTab::PROMOTION, Vici::MallTab::WEAPON, Vici::MallTab::ARMOR, Vici::MallTab::CONSUMABLE, Vici::MallTab::MISC]
      end
  end 


  def spend_money(buyer, quantity, currency)
    return unless is_buyer_has_enough_money?(buyer, currency, quantity)
    raise InvalidCurrencyError unless [Vici::Currency::DIAMOND, Vici::Currency::VOUCHER].include?(currency)
    account = buyer.account
    if currency == Vici::Currency::DIAMOND
      account.diamond -= quantity*self.diamond_price
      #logger.mall_buy_diamond(buyer.id, buyer.level, buyer.profession, quantity, mall_item.static_item_id, quantity*mall_item.diamond_price)
    elsif currency == Vici::Currency::VOUCHER
      #logger.mall_buy_voucher(buyer.id, buyer.level, buyer.profession, quantity, mall_item.static_item_id, quantity*mall_item.voucher_price)
      buyer.voucher -= quantity*self.voucher_price
    else
      return
    end
    account.save
    buyer.save
  end
 

  def is_buyer_has_enough_money?(buyer, currency, quantity)
    if currency == Vici::Currency::DIAMOND
      raise NotEnoughDiamondError if buyer.account.diamond < quantity*self.diamond_price
    elsif currency == Vici::Currency::VOUCHER
      raise NotEnoughVoucherError if buyer.voucher < quantity*self.voucher_price
    end
    true
  end

end
