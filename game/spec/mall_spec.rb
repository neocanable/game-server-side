
require File.expand_path(File.dirname(__FILE__) + "/../spec")
require File.expand_path(File.dirname(__FILE__) + "/prepare_helper")

describe Mall do
  include PrepareHelper

  before do 
    truncate_table("malls")
    prepare_character

    @diamond = Vici::Currency::DIAMOND
    @voucher = Vici::Currency::VOUCHER
  end
 
  it "not enough diamond for mall item" do
    mall = prepare_mall_item
    lambda{mall.spend_money(@character, 1, @diamond)}.should raise_error(NotEnoughDiamondError)

    lambda{mall.spend_money(@character, 1, @voucher)}.should raise_error(NotEnoughVoucherError)
  end

  it "should spend diamond" do
    mall = prepare_mall_item
    @character.earn_diamond!(100)
    mall.spend_money(@character, 1, @diamond).should be_true
  end

  it "should spend voucher" do
    mall = prepare_mall_item
    @character.earn_voucher!(100)
    mall.spend_money(@character, 1, @voucher).should be_true
  end

  it "should return mall list" do 
    prepare_all_mall_item
    mall_items, pages, page, tab = Mall.list(0, Vici::MallTab::ARMOR)
    mall_items.size.should == Vici::MALL_ITEMS_PER_PAGE
    Vici::MALL_ITEMS_PER_PAGE.should == 12
    pages.should == 3
    page.should == 1
  end

  private 
    def prepare_all_mall_item
      (1..32).each do |i|
        [Vici::MallTab::ARMOR, Vici::MallTab::CONSUMABLE, Vici::MallTab::MISC, Vici::MallTab::PROMOTION, Vici::MallTab::WEAPON].each do |tab|
          Mall.create :tab => tab, :index => i, :static_item_id => 80, :stack => i, :diamond_price => i, :voucher_price => i
        end
      end
    end
    
    def prepare_mall_item
      Mall.create :tab => Vici::MallTab::PROMOTION, :index => 1,:static_item_id => 80, :stack => 1, :diamond_price => 1, :voucher_price => 1 
    end

end
