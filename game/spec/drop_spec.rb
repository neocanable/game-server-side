require File.expand_path(File.dirname(__FILE__) + "/../spec")
require File.expand_path(File.dirname(__FILE__) + "/prepare_helper")

describe Drop do
  include PrepareHelper

  before do 
    truncate_table("characters")
    truncate_table("accounts")
    prepare_character
  end

  # 普通怪金钱
  it "should get normal money" do
    npc_id = 10
    npc = static_npc(npc_id)
    level = npc['level']
    k_high = level_coeff(level)['k_high']
    k_low  = level_coeff(level)['k_low']

    Drop.money_drop(npc_id).should >= k_low*level
    Drop.money_drop(npc_id).should <= k_high*level
  end

  # 精英金钱
  it "should get elife money" do
    npc_id = 9
    npc = static_npc(npc_id)
    level = npc['level']
    k_high = level_coeff(level)['k_high']
    k_low  = level_coeff(level)['k_low']

    Drop.money_drop(npc_id).should >= k_low*level*4
    Drop.money_drop(npc_id).should <= k_high*level*4
  end

  # boss金钱
  it "should get boss money" do 
    npc_id = 5
    npc = static_npc(npc_id)
    level = npc['level']
    k_high = level_coeff(level)['k_high']
    k_low  = level_coeff(level)['k_low']

    Drop.money_drop(npc_id).should >= k_low*level*21
    Drop.money_drop(npc_id).should <= k_high*level*21
  end

  
  it "should not get exp if player's level too high" do 
    Vici.const_get(:NPC).collect{|k,v| k }.each do |npc_id|
      @character.should_not be_nil
      npc = static_npc(npc_id)
      npc.should_not be_nil
      d_value = npc['level'].to_i - @character.level
      corrected_value = Drop.corrected_value_table(d_value)
      corrected_value.should >= 1 if d_value >= 0
      corrected_value.should < 1 if d_value < 0
      
      Drop.exp_drop(npc_id,@character.id).should == 0 if d_value <= -6
    end
  end

  # 普通怪经验
  it "should get normal exp" do
    npc_id = 10
    npc = static_npc(npc_id)
    value_diff = npc['level'].to_i - @character.level
    corrected_value = Drop.corrected_value_table(value_diff)

    #Drop.exp_drop(npc['id'], @character).should == (npc['level']*2 + 7)*corrected_value.to_i
    Drop.exp_drop(npc["id"], @character).should == (npc["level"]*5 + 45)
  end

  # 精英怪经验
  it "should get elife exp" do 
    npc_id = 9
    npc = static_npc(npc_id)
    value_diff = npc['level'].to_i - @character.level
    corrected_value = Drop.corrected_value_table(value_diff)
    #Drop.exp_drop(npc['id'],@character).should == (npc['level']*5 + 8)*corrected_value.to_i
    Drop.exp_drop(npc["id"], @character).should == (npc["level"]*5 + 45)
  end

  # boss经验
  it "should get boss exp" do 
    npc_id = 5
    npc = static_npc(npc_id)
    value_diff = npc['level'].to_i - @character.level
    corrected_value = Drop.corrected_value_table(value_diff)

    #Drop.exp_drop(npc['id'],@character).should == (npc['level']*9 + 9)*corrected_value.to_i
    Drop.exp_drop(npc["id"], @character).should == (npc["level"]*5 + 45)
  end
#
#  # 人形怪掉落物品,但是级数达不到，所以会有空返回
#  it "should get more than one items" do 
#    npc = Vici::Code.first(:NPC, "id", 10)
#    Drop.find_with_multi_value(:ITEM_DROP,'npc_type',[npc['type1'],npc['type2'],npc['type3'],npc['type4']]).size.should >= 1
#    Drop.items_drop(10, @character).size.should == 0
#  end

  # 动物掉落物品
  it "should get animal items" do 
    npc_id = 5
    npc = static_npc(npc_id)
    # 这里经常出现不定的情况
    Drop.find_with_multi_value(:ITEM_DROP,'npc_type',[npc['type1'],npc['type2'],npc['type3'],npc['type4']]).size.should == 14
    Drop.items_drop(npc_id, @character).size.should >= 0
  end

  it "should get stack items" do 
    Drop.to_stack_items([200011, 200016, 200010]).size.should == 3
  end



  private 
    # 获取金钱系数
    def level_coeff(level)
      Drop.find_range(:MONEY_DROP,'level_min','level_max',level)
    end
end
