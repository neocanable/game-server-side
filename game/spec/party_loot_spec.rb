require File.expand_path(File.dirname(__FILE__) + "/../spec")
require File.expand_path(File.dirname(__FILE__) + "/prepare_helper")

describe "PartyLoot" do
  include PrepareHelper

  before do 
    truncate_table("parties")
    truncate_table("player_quests")
    truncate_table("characters")
    truncate_table("accounts")
    truncate_table("scene_objects")
    truncate_table("scene_object_items")
    prepare_character
    @c1 = prepare_character2
    @c2 = prepare_character2
    @c3 = prepare_character2
  end
  
  it "should return character can loot list" do

    party = prepare_party(@character.id)
    party.loot_method = Vici::LootMethod::FREE_FOR_ALL
    party.save
    @character.party_id = party.id
    @character.save

    scene_object = prepare_scene_object(@character, party)
    # 苏菲的胸针
    quest_item = prepare_scene_object_item(@character, scene_object, 200007)
    item86 = prepare_scene_object_item(@character, scene_object, 86)
    item87 = prepare_scene_object_item(@character, scene_object, 87)

    character_quest = prepare_quest(@character, 9998)
    scene_object.can_loot_list(@character).size.should == 3

    character_quest.objective1_progress = 1
    character_quest.save

    scene_object.can_loot_list(@character).size.should == 2
  end

  it "should not see item if not have quest" do 
    party = prepare_party(@character.id)
    party.loot_method = Vici::LootMethod::FREE_FOR_ALL
    party.save
    @character.party_id = party.id
    @character.save

    scene_object = prepare_scene_object(@character, party)
    # 苏菲的胸针
    quest_item = prepare_scene_object_item(@character, scene_object, 200007)
    item86 = prepare_scene_object_item(@character, scene_object, 86)
    item87 = prepare_scene_object_item(@character, scene_object, 87)

    character_quest = prepare_quest(@character, 9998)


    character_quest.objective1_progress = 1
    character_quest.save!
    scene_object.can_loot_list(@character).size.should == 2
    scene_object.can_loot_list(@character).include?(item86).should be_true 
  end



  private

    def prepare_scene_object(character, party)
      character_id = character.nil? ? nil : character.id
      party_id     = party.nil? ? nil : party.id
      SceneObject.create :character_id => character_id,:x => 0, :y => 0, :scene_id => 1, :party_id => party_id
    end

    def prepare_scene_object_item(character, scene_object, static_item_id)
      SceneObjectItem.create :static_item_id => static_item_id, :scene_object_id => scene_object.id, :quantity => 1
    end

    def prepare_quest(character, quest_id)
      PlayerQuest.create :quest_id => quest_id,:objective1_progress => 0,:objective2_progress => 0, :objective3_progress => 0, :objective4_progress => 0,:character_id => character.id
    end

    def prepare_party(leader_id)
      character = Character.find_by_id(leader_id)
      party = Party.create(:leader_id => leader_id, :number_of_members => 1)
      character.party_id =  party.id
      character.save!
      party
    end

end
