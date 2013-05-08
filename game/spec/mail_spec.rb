
require File.expand_path(File.dirname(__FILE__) + "/../spec")
require File.expand_path(File.dirname(__FILE__) + "/prepare_helper")

describe Account do
  include PrepareHelper

  before do 
    prepare_character
  end
  
  it "should mark mail as read" do 
    mail = prepare_mail(@character)
    mail.read!
    mail.unread.should == false
  end

  it "should receive money from mail" do 
    mail = prepare_mail(@character)
    mail.money = 100
    mail.save

    mail.receive_money!
    mail.money.should == 0
  end

  it "can paginate mail" do 
    truncate_table("mails")
    page = 1
    per_page = 2
    (1..10).each do |i|
      prepare_mail(@character)
    end

    results, pages = Mail.paginate(1, 2)
    results.size.should == 2
    pages.should == 5
  end

  private
    def prepare_mail(character)
      Mail.create 
    end

end
