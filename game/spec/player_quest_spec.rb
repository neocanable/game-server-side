
require File.expand_path(File.dirname(__FILE__) + "/../spec")
require File.expand_path(File.dirname(__FILE__) + "/prepare_helper")
require File.expand_path(File.dirname(__FILE__) + "/quest_data_prepare")

describe "PlayerQuest" do
  include PrepareHelper
  include QuestDataHelper

  before do 
    truncate_table("player_quests")
    truncate_table("items")
    prepare_character
    prepare_static_quests
  end

  it "can test quest can accept" do 
    @character.can_accept_quest?(1).should be_true
  end

  it "should test level satisfy" do
    @character.level = 0
    @character.save
    @character.can_accept_quest?(1).should be_false   
  end

  it "should return player doing quest" do 
    player_quest = prepare_quest(@character.id, @quest_1["id"])
    player_quest = prepare_quest(@character.id, @quest_2["id"])
    @character.doing_quests.size.should == 2
  end

  it "should return start npcs" do 
    start_static_npcs = [@quest_1, @quest_2].collect{|e| e["start_npc"] }
    prepare_quest(@character.id, @quest_1["id"])
    prepare_quest(@character.id, @quest_2["id"])
  end

  it "should update gossip quest" do 
    # 任务3需要的对话id是80
    player_quest = prepare_quest(@character.id, 3)
    player_quest.update_gossip_quest!(80)
    player_quest.objective1_progress.should == 1
  end

  it "should increase quest progress item count" do 
    player_quest = prepare_quest(@character.id, 2)
    item = Item.create :static_item_id => 121002, :character_id => @character.id, :quantity => 1
    player_quest.update_progress
    player_quest.objective1_progress.should == 1
  end

  it "should return quest need items count" do 
    player_quest = prepare_quest(@character.id, 2)
    @character.need_item_count(121002).should == 1
  end

  it "should gets character's item count" do 
     item = Item.create :static_item_id => 121002, :character_id => @character.id, :quantity => 1
     player_quest = prepare_quest(@character.id, 2)
  end

  it "should update item quest" do 
    player_quest = prepare_quest(@character.id, 2)
    player_quest.update_item_quest!(121002, 1)
    player_quest.objective1_progress.should == 1
  end

  it "should increase quest item count" do 
    player_quest = prepare_quest(@character.id, 2)
    player_quest.increase_count(121002, 1)
    player_quest.objective1_progress.should == 1
  end

  it "should decrease quest item count" do 
    player_quest = prepare_quest(@character.id, 2)
    player_quest.increase_count(121002, 1)
    player_quest.objective1_progress.should == 1

    player_quest.decrease_count(121002, -1)
    player_quest.objective1_progress.should == 0
  end


  private
    def prepare_quest(character_id, quest_id)
      PlayerQuest.create :quest_id => quest_id,:objective1_progress => 0,:objective2_progress => 0, :objective3_progress => 0, :objective4_progress => 0,:character_id => character_id
    end


end
