
require File.expand_path(File.dirname(__FILE__) + "/../spec")
require File.expand_path(File.dirname(__FILE__) + "/prepare_helper")

describe Gossip do
  include PrepareHelper

  before do 
    prepare_character
  end

#  it "should talk to npc" do 
#    Gossip.valid_gossip(5, @character)
#  end

  it "should retrieve npc" do
    Gossip.retrieve_npc(5).should == Vici::Code.first(:NPC, "id", 5)
  end

  it "should raise error if npc not find" do 
    lambda{Gossip.retrieve_npc(1000000000)}.should raise_error
  end

  it "should return npc default gossip" do
    Gossip.npc_default_gossip(5).should == 0
    Gossip.npc_default_gossip(60).should == 300
  end

  it "should retrieve gossip" do
    Gossip.retrieve_gossip(0).should == Vici::Code.first(:GOSSIP, "id", 0)
  end

  it "should raise error if gossip not find" do
    lambda{Gossip.retrieve_gossip(1000000000)}.should raise_error
  end

  it "should retrieve gossip option" do 
    #.size.should > 0
    gossip_options = Vici::Code.find(:GOSSIP, 'parent', 0)
    Gossip.retrieve_gossip_options(0, 5, @character).size.should == gossip_options.size
    Gossip.retrieve_gossip_options(0, 5, @character).should == gossip_options.collect{|o|[o['id'], o["content"], o['type'], o['quest']] }
  end

  it "should valid script condition" do
    gossip = Vici::Code.first(:GOSSIP, "id", 301)
    Gossip.script_condition(gossip, @character).should be_false
    @character.level = 3
    Gossip.script_condition(gossip, @character).should be_true   
  end

end
