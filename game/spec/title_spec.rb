require File.expand_path(File.dirname(__FILE__) + "/../spec")
require File.expand_path(File.dirname(__FILE__) + "/prepare_helper")

describe Character do
  include PrepareHelper

  before do 
    truncate_table("titles")
    prepare_character
  end

  it "should use title" do
    title = prepare_title
    @character.use_title(title).should be_true
    @character.current_title.should == 1
    @character.use_title(nil).should be_true
    @character.current_title.should be_nil
  end

  private 
    def prepare_title
      Title.create :title_id => 1, :character_id => @character.id
    end
end
