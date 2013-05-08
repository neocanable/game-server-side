require File.expand_path(File.dirname(__FILE__) + "/../spec")
require File.expand_path(File.dirname(__FILE__) + "/prepare_helper")

describe Character do
  include PrepareHelper

  before do 
    truncate_table("containers")
    truncate_table("items")
    prepare_character
  end

#  it "should got default value" do
#    #@character.money.should   == 0
#    #@character.voucher.should == 0
#    #@character.honor.should   == 0
#
#    #@character.level.should   == 1
#    #@character.xp.should      == 0
#    #@character.unspent_points.should == 0
#
#    # NND，默认值容易变化，单元测试不加了-_-!
#  end
#
#  it "should create character faild if name too long" do
#    character = Character.create :name => "123456789012345", :appearance => 0, :profession => 0,:account_id => @account.id   
#    character.errors.empty?.should be_false
#  end
#
#  it "should create character faild if no appearance or profession" do
#    character = Character.create :name => "123456789012345", :profession => 0,:account_id => @account.id   
#    character.errors.empty?.should be_false
#
#    character = Character.create :name => "123456789012345", :appearance => 0, :account_id => @account.id   
#    character.errors.empty?.should be_false
#  end
#
#  it "should not create character which same dumplicate or name is NULL" do
#    name = fake_name
#    character = Character.create :name => name, :appearance => 0, :profession => 0,:account_id => @account.id      
#    character1 = Character.create :name => name, :appearance => 0, :profession => 0,:account_id => @account.id      
#    character1.errors.empty?.should be_false
#
#    character = Character.create :appearance => 0, :profession => 0,:account_id => @account.id      
#    character.errors.empty?.should be_false
#  end
#
#  it "should level up who has enough xp" do 
#    @character.level.should == 1
#    base_xp = Vici::Code.first(:XP, 'level', @character.level)
#    prev_base_xp = base_xp["xp"].to_i
#    @character.xp = prev_base_xp + 10
#    @character.level_up!
#    @character.level.should == 2
#    @character.xp.should == 10
#  end
#
#  it "should gain xp and level up" do
#    @character.level.should == 1
#    @character.gain_xp!(73)
#    @character.level_up!
#    #@character.level.should == 2
#  end
#
#  it "should spent spell point" do
#    @character.unspent_points = 10
#    @character.save
#
#    @character.spend_spell_points!
#    @character.unspent_points.should == 9
#    @character.spend_spell_points!(2)
#    @character.unspent_points.should == 7
#  end
#
#  it "should not learn spell if no spell points" do 
#    @character.unspent_points = 0
#    @character.save
#
#    @character.can_learn_spell?.should be_false
#  end
#
#  it "can learn spell if unspent_points > 0" do 
#    @character.unspent_points = 1
#    @character.save
#
#    @character.can_learn_spell?.should be_true
#  end
#
#  it "should return character's spell which had learned!" do
#    Spell.create :character_id => @character.id, :spell_id => 1, :rank => 1
#    @character.specify_spell(1).should_not be_nil
#
#    truncate_table("spells")
#    @character.specify_spell(1).should be_nil
#  end
#
#  it "should test character can change profession" do 
#    @character.level = 1
#    @character.save
#    @character.can_change_profression_to?(1).should be_false
#
#    @character.level = 10
#    @character.can_change_profression_to?(1).should be_true
#  end

  it "should return character's unit id" do 
    @character.unit_id.to_i.should == @character.id
    @character.unit_id.to_s.should == "0000000"+@character.id.to_s
  end

  it "can change profession" do 
    @character.change_profession!(1)
    @character.profession.should == 1
  end

  it "should level up and unlock bank" do 
    @character.xp = 100000
    @character.save!
    @character.level_up!
    @character.level.should > 1
    bank = @character.containers.first(:conditions => ["container_type=?", Vici::ContainerType::BANK])
    bank.max_slot.should == 15*4
      
  end




end
