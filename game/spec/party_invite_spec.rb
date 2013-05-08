require File.expand_path(File.dirname(__FILE__) + "/../spec")
require File.expand_path(File.dirname(__FILE__) + "/prepare_helper")

describe "PartyInviteRequest" do
  include PrepareHelper

  before do 
    truncate_table("parties")
    truncate_table("party_invite_requests")
    prepare_character
    prepare_party(@character.id)
    @c1 = prepare_character2
    @c2 = prepare_character2
    @c3 = prepare_character2
  end

  it "should create a party invite request" do 
    invite = Party.create_invite(@character, @c1)
    invite.leader_id.should == @character.id
    invite.target_id.should == @c1.id
  end

  it "should raise error when target character has a request" do 
    invite = Party.create_invite(@character, @c1)
    lambda{ Party.create_invite(@c2, @c1) }.should raise_error(PlayerIsBusyError)
  end

  it "should raise error when target character in party" do 
    @c1.party_id = @party.id
    @c1.save

    lambda{ Party.create_invite(@c2, @c1) }.should raise_error(AlreadyInPartyError)
  end

  it "should raise error if party is full" do 
    @party.number_of_members = Vici::PARTY_MAX_MEMBERS
    @party.save

    lambda{ Party.create_invite(@character, @c1) }.should raise_error(PartyIsFullError)
  end

  it "should raise error if not party leader" do 
    @c2.party_id = @party.id
    @c2.save

    lambda{ Party.create_invite(@c2, @c1) }.should raise_error(NotPartyLeaderError)
  end

  it "should decline request" do 
    invite = Party.create_invite(@character, @c1)
    Party.decline_invite(invite.id).should be_true
  end


  private

    def prepare_party(leader_id)
      character = Character.find_by_id(leader_id)
      @party = Party.create :leader_id => leader_id, :number_of_members => 1
      character.party_id =  @party.id
      character.save
    end

end
