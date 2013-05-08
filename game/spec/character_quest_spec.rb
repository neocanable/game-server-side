require File.expand_path(File.dirname(__FILE__) + "/../spec")
require File.expand_path(File.dirname(__FILE__) + "/prepare_helper")

describe "Character quest spec" do
  include PrepareHelper

  before do 
    prepare_character
    truncate_table("player_quests")
    truncate_table("player_completed_quests")
    @quest_1 = Vici::Code.first(:QUEST, "id", 1)
    @quest_2 = Vici::Code.first(:QUEST, "id", 2)
    @quest_3 = Vici::Code.first(:QUEST, "id", 3)
  end

  it "should can accept quest" do 
    @character.can_accept_quest?(@quest_1["id"]).should be_true   
  end

  it "should get character :available_quests" do 
    quests = @character.can_do_quests
    quests.size.should > 0
  end

  it "should get character doing quests" do 
    @character.doing_quests.size.should == 0
    quest = prepare_player_quest(@quest_1["id"], @character.id)
    @character.player_quests.reload     # fuck activerecord's dirty data
    @character.doing_quests.size.should == 1
    @character.doing_quests.first.should == @quest_1
  end

  it "should abandon quest" do 
    quest = prepare_player_quest(@quest_1["id"], @character.id)   
    @character.abandon_quest(@quest_1["id"])
    @character.doing_quests.size.should == 0
  end

  it "should abandon_quest error if not accept quest" do 
    lambda{@character.abandon_quest(100)}.should raise_error
  end

  it "should accept quest" do
    @character.accept_quest(@quest_1["id"])
    quests = @character.doing_quests
    quests.size.should == 1
    quests.first.should == @quest_1
  end

  it "should get player_quest need npc count" do 
    # @quest_1 需要杀npc => 101001 数量为1
    player_quest = prepare_player_quest(@quest_1["id"],  @character.id)
    @character.need_npc_unfinish_player_quests(101001).size.should == 1
    @character.need_npc_unfinish_player_quests(101001).first.should == player_quest
  end

  it "should get player_quest need item count" do 
    # @quest_2 需要收集物品 => 121002 数量为1
    player_quest = prepare_player_quest(@quest_2["id"],  @character.id)
    #@character.need_item_unfinish_player_quests(60).size.should == 1
    #@character.need_item_unfinish_player_quests(60).first.should == player_quest
  end

  it "should get player_quest need gossip count" do 
    player_quest = prepare_player_quest(@quest_3["id"], @character.id)
    @character.need_gossip_unfinish_player_quests(80).size.should == 1
    @character.need_gossip_unfinish_player_quests(80).first.should == player_quest
  end

  it "should complete quest" do 
    player_quest = prepare_player_quest(@quest_1["id"],  @character.id)
    player_quest.objective1_progress = 1
    player_quest.save
    quest = static_quest(player_quest.quest_id)
    @character.destroy_progress_and_complete(player_quest, quest)
    @character.player_completed_quests.size.should == 1
  end

  it "should complete items" do 
    player_quest = prepare_player_quest(@quest_1["id"],  @character.id)
    player_quest.objective1_progress = 1
    player_quest.save   
    changed_items = @character.complete_quest_items(@quest_1, 1)
    changed_items.size.should == 1
  end

  it "should take away items" do
    player_quest = prepare_player_quest(@quest_2["id"],  @character.id)
    player_quest.objective1_progress = 1
    player_quest.save   
    truncate_table("items")
    truncate_table("containers")
  end

  it "should give character money when complete_quest" do 
    @character.money = 0
    @character.save!
    @character.complete_quest_money(@quest_1["id"].to_i)
    @character.money.should == @quest_1["gain_money"].to_i
  end

  private
    def prepare_player_quest(quest_id, character_id)
      PlayerQuest.create :character_id => character_id, :quest_id => quest_id, :objective1_progress => 0, 
                         :objective2_progress => 0, :objective3_progress => 0, :objective4_progress => 0
    end

end
