require File.expand_path(File.dirname(__FILE__) + "/../spec")
require File.expand_path(File.dirname(__FILE__) + "/prepare_helper")

describe Account do
  include PrepareHelper

  before do 
    prepare_character
  end

  it "should return account's characters" do 
    @account.login_list.size.should == 1
    @account.login_list.first.should == [@character.id, @character.name, 0,0,1,1000,0,0,0]
  end

  it "should create a character for account" do 
    character = @account.create_character("neo",1)
    character.account_id.should == @account.id
  end

  it "should return account last login character" do 
    character = @account.default_character
    character.should == @character
  end

end
