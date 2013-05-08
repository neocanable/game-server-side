
require File.expand_path(File.dirname(__FILE__) + "/../spec")
require File.expand_path(File.dirname(__FILE__) + "/prepare_helper")

describe Item do
  include PrepareHelper

  before do 
    prepare_character
    @item1_id = 60
    @item2_id = 80

    @big_int = 1000000000
  end

  it "should get item sell price" do 
    Item.create_stacking_item(@item1_id ,@character.id, 1).nil?.should be_false
  end

  it "should raise error if reach max_stack" do 
    lambda{Item.create_stacking_item(@item1_id, @character.id, @big_int)}.should raise_error
  end



  it "should valid profession" do 
    item = static_item(@item2_id)
    Item.is_valid_profession?(@character, item).should be_true
  end

  it "should valid two_hand_weapon" do 
    item = prepare_item(@item2_id)
    item.is_two_hand_weapon?.should be_true
  end

  it "should valid equipment" do 
    item = prepare_item(@item2_id)
    item.is_equipment?.should be_true
  end

  it "should return item valid profession" do 
    Item.advanced_professions(0).should == [1, 5, 6, 7, 8, 9, 10, 2, 3, 4, 23, 24, 25, 26, 27, 28]
    Item.advanced_professions(1).should == [5, 6, 7, 8, 9, 10]
    item = static_item(@item2_id)
    Item.item_valid_professions(item).should == [0, 1, 5, 6, 7, 8, 9, 10, 2, 3, 4, 23, 24, 25, 26, 27, 28]
  end

  private 
    def prepare_item(item_id, character = @character, amount = 1)
      Item.create_stacking_item(item_id, character.id, amount)
    end

end
