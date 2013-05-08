
require File.expand_path(File.dirname(__FILE__) + "/../spec")
require File.expand_path(File.dirname(__FILE__) + "/prepare_helper")

describe "Core Extention spec" do
  include PrepareHelper

  before do 
    #prepare_character
  end

  it "should return a readable time format" do
    sec = 1
    min = 60
    hour = min*60
    day = hour*24
    now = Time.now
    (now - 1).readable_format.should == "刚刚"
    (now - min*2-1).readable_format.should == "2 分钟前"
    (now - hour).readable_format.should == "1 小时前"
    (now - hour - 2).readable_format.should == "1 小时前"
    (now - day*2).readable_format.should == "2 天前"
  end

end
