require File.expand_path(File.dirname(__FILE__) + "/../spec")
require File.expand_path(File.dirname(__FILE__) + "/prepare_helper")

describe Character do
  include PrepareHelper

  before do 
    prepare_character
    @character.voucher = 100
    @character.money   = 100
    @character.honor   = 100
    account = @character.account
    account.diamond    = 100
    @character.save
    account.save
  end


  it "should test character has enough money" do 
    @character.money = 100

    @character.has_enough_money?(100).should be_true
    @character.has_enough_money?(101).should be_false
  end

  it "should test character has enough honor" do 
    @character.honor = 100

    @character.has_enough_honor?(100).should be_true
    @character.has_enough_honor?(101).should be_false   
  end

  it "should test voucher" do 
    @character.voucher = 100

    @character.has_enough_voucher?(100).should be_true
    @character.has_enough_voucher?(101).should be_false
  end

  it "should test character has enough diamond" do
    account = @character.account
    account.diamond = 100
    
    @character.has_enough_diamond?(100).should be_true
    @character.has_enough_diamond?(101).should be_false
  end

  it "should spend diamond" do
    @character.spend_money!(1)
    @character.money.should == 99
  end

  it "should spend honor" do
    @character.spend_honor!(1)
    @character.honor.should == 99
  end

  it "should spend voucher" do
    @character.spend_voucher!(1)
    @character.voucher.should == 99
  end

  it "should spend diamond" do 
    account = @character.account
    @character.spend_diamond!(1)
    account.diamond.should == 99
  end

  it "should earn money" do 
    @character.earn_money!(1)
    @character.money.should == 101
  end

  it "should earn voucher" do
    @character.earn_voucher!(1)
    @character.voucher.should == 101
  end

  it "should earn honor" do
    @character.earn_honor!(1)
    @character.honor.should == 101
  end

  it "should earn diamond" do
    account = @character.account
    @character.earn_diamond!(1)
    account.diamond.should == 101
  end


end
