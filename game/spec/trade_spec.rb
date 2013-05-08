
require File.expand_path(File.dirname(__FILE__) + "/../spec")
require File.expand_path(File.dirname(__FILE__) + "/prepare_helper")

describe Trade do
  include PrepareHelper

  before do 
    truncate_table("trades")
    truncate_table("trade_items")
    truncate_table("containers")
    truncate_table("items")
    prepare_character
    @c1 = prepare_character2
    @c2 = prepare_character2
  end

  it "should return character latest trade" do 
    @character.latest_trade.should be_nil
    trade = Trade.create_trade(@character, @c1)   
    @character.latest_trade.should == trade
  end

  it "should create new trade" do 
    trade = Trade.create_trade(@character, @c1)
    trade.character1_id.should == @character.id
    trade.character2_id.should == @c1.id
  end

  it "should create trade fail if target character in trade" do 
    Trade.create_trade(@character, @c1)   
    lambda{Trade.create_trade(@character, @c1)}.should raise_error(PlayerIsBusyError)   
  end

  it "should create trade fail if invite self" do
    lambda{Trade.create_trade(@character, @character)}.should raise_error
  end

  it "should set money to trade" do 
    @character.money = 100
    @character.save
    trade = Trade.create_trade(@character, @c1)      
    trade.set_money(@character, 100)
    trade.character1_money.should == 100    
  end

  it "should set item to trade" do 
    trade = Trade.create_trade(@character, @c1)
    trade.set_item(@character, 0, Vici::ContainerType::BAG_EQUIPMENT, 0, 1)
    trade.trade_items.size.should == 1    
  end

  it "should change item from trade" do 
    trade = Trade.create_trade(@character, @c1)
    trade.set_item(@character, 0, Vici::ContainerType::BAG_EQUIPMENT, 0, 1)
    trade_item = trade.set_item(@character, 0, Vici::ContainerType::BAG_EQUIPMENT, 1, 1)
    trade.trade_items.size.should == 1  
  end

  it "should exchange money" do 
    @character.money = 100
    @c1.money        = 100
    @character.save
    @c1.save
    trade = Trade.create_trade(@character, @c1)   
    trade.set_money(@character, 100)
    #trade.set_money(@character, 100)
    trade.money_change.should be_true
  end

  it "should set money error" do 
    @character.money = 100
    @character.save
    trade = Trade.create_trade(@character, @c1)   
    lambda{trade.set_money(@character, 1000)}.should raise_error(NotEnoughMoneyError) 
  end

  it "should change money error" do
    @character.money = 100
    @character.save
    trade = Trade.create_trade(@character, @c1)
    trade.set_money(@character, 100)
    @character.money -= 1
    @character.save
    lambda{trade.money_change}.should raise_error(NotEnoughMoneyError)
  end

  it "should remove item from trade" do 
    trade = Trade.create_trade(@character, @c1)
    trade.set_item(@character, 0, Vici::ContainerType::BAG_EQUIPMENT, 0, 1)
    trade.trade_items.size.should == 1    
    trade.remove_item(@character, 0)
    trade.trade_items.size.should == 0
  end

  it "should unconfirm trade" do 
    trade = Trade.create_trade(@character, @c1)
    trade.state = Vici::TradeState::C1_CONFIRM
    trade.unconfirm!
    trade.state.should == Vici::TradeState::NO_CONFIRM
  end

  it "should get confirm character" do
    trade = Trade.create_trade(@character, @c1)
    trade.state = Vici::TradeState::C1_CONFIRM
    trade.save
    trade.confirm_character.should == @character
  end

end
