require File.expand_path(File.dirname(__FILE__) + "/../spec")
require File.expand_path(File.dirname(__FILE__) + "/prepare_helper")

describe ActionBar do
  include PrepareHelper

  before do 
    prepare_character
    truncate_table("action_bars")  # 新手有创建action bar的

    @spell_id = 10000
    @item_id  = 10001

    @slot0    = 0
    @slot1    = 1
  end

  it "newbie action bar"  do 
    slot_index, type, action = ActionBar.create_character_default_action_bars(@character.id)
    slot_index.should == @slot0
    type.should == Vici::SlotType::SPELL
    action.should == @spell_id
  end

  it "should place action bar if the slot has exist!!!" do 
    slot_index, type, action = ActionBar.place(@character.id, @slot0, @spell_id, nil)
    slot_index.should == @slot0
    type.should == Vici::SlotType::SPELL
    action.should == @spell_id

    slot_index, type, action = ActionBar.place(@character.id, @slot0, nil, @item_id)
    slot_index.should == @slot0
    type.should == Vici::SlotType::ITEM
    action.should == @item_id
  end

  it "should create new action bar" do 
    action_bar = ActionBar.find(:first, :conditions => ["character_id=? AND slot_index=?", @character.id, @slot0])
    action_bar.should be_nil
    slot_index, type, action = ActionBar.place(@character.id, @slot0, @spell_id, nil)
    slot_index.should == @slot0
    type.should == Vici::SlotType::SPELL
    action.should == @spell_id
  end

  it "should get character all action bars" do 
    bar1 = prepare_action_bar(@slot0, @spell_id, nil)
    bar2 = prepare_action_bar(@slot1, nil, @spell_id)

    bars = ActionBar.get_all(@character.id)
    bars.size.should == 2

    bars.first[0].should == bar1.slot_index
    bars.first[1].should == Vici::SlotType::SPELL
    bars.first[2].should == @spell_id
  end

  it "swap 2 action bar" do 
    prepare_action_bar(@slot0, @spell_id, nil)
    prepare_action_bar(@slot1, nil, @item_id)

    ActionBar.swap(@character.id, @slot0, @slot1)
    bar1 = ActionBar.find(:first, :conditions => ["character_id=? AND slot_index=?", @character.id, @slot0])
    bar2 = ActionBar.find(:first, :conditions => ["character_id=? AND slot_index=?", @character.id, @slot1])

    bar1.spell_id.should be_nil
    bar1.item_id.should == @item_id

    bar2.spell_id.should == @spell_id
    bar2.item_id.should be_nil
  end

  it "should move 1 action bar" do 
    prepare_action_bar(@slot0, @spell_id, nil)
    ActionBar.swap(@character.id, @slot0, @slot1)
    bar1 = ActionBar.find(:first, :conditions => ["character_id=? AND slot_index=?", @character.id, @slot0])
    bar2 = ActionBar.find(:first, :conditions => ["character_id=? AND slot_index=?", @character.id, @slot1])
    bar1.should be_nil
    bar2.spell_id.should == @spell_id

    ActionBar.swap(@character.id, @slot1, @slot0)
    bar1 = ActionBar.find(:first, :conditions => ["character_id=? AND slot_index=?", @character.id, @slot0])
    bar2 = ActionBar.find(:first, :conditions => ["character_id=? AND slot_index=?", @character.id, @slot1])
    bar1.spell_id.should == @spell_id
    bar2.should be_nil
  end

  

  private
    def prepare_action_bar(slot_index, spell_id, item_id)
      ActionBar.create :slot_index => slot_index, :spell_id => spell_id, :item_id => item_id, :character_id => @character.id
    end


end
