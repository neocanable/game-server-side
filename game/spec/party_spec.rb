require File.expand_path(File.dirname(__FILE__) + "/../spec")
require File.expand_path(File.dirname(__FILE__) + "/prepare_helper")

describe Party do
  include PrepareHelper

  before do 
    truncate_table("parties")
    prepare_character
    prepare_party(@character.id)
    @c1 = prepare_character2
    @c2 = prepare_character2
    @c3 = prepare_character2
  end
  
  it "should get party leader" do
    @party.leader.should == @character
  end

  it "should get same scene character with c1" do
    @character.scene_id = @c1.scene_id
    @c2.scene_id     = @c1.scene_id
    @party.add_member!(@c1)
    @party.add_member!(@c2)

    @party.same_scene_characters(@c1).size == 3
    @c2.scene_id = 100000000
    @c2.save!

    @party.same_scene_characters(@c1).size == 2
  end

  it "should add new member" do 
    @party.add_member!(@c3)
    @party.number_of_members.should == 2
    @c3.party_id.should == @party.id
  end

  it "should diband party" do 
    @party.number_of_members = 2
    @party.save

    @party.is_party_disband?.should be_true
  end

  it "should get party loot turn" do
    #因为character的id小
    @party.add_member!(@c1)
    @party.add_member!(@c2)
    @party.turn_character.should == @character
    @party.turn_character.should == @c1
    @party.turn_character.should == @c2
  end

  private

    def prepare_party(leader_id)
      character = Character.find_by_id(leader_id)
      @party = Party.create :leader_id => leader_id, :number_of_members => 1
      character.party_id =  @party.id
      character.save
    end

end
