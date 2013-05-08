require File.expand_path(File.dirname(__FILE__) + "/../spec")
require File.expand_path(File.dirname(__FILE__) + "/prepare_helper")

describe Item do
  include PrepareHelper

  before do 
    truncate_table("items")
    truncate_table("containers")
    prepare_character
  end

  it "should craft an equipment" do
    static_recipe = static_recipe(81)
    prepare_item(85, @character, 10)
    prepare_item(86, @character, 90)
    item = Item.craft!(@character, static_recipe,[])
    item.static_item_id.should == static_recipe["item_id"].to_i
  end

  it "should create an equipment directly" do 
    item = Item.create_equipment(@character, 81)
    item.static_item_id.should == 81
  end

  it "should return an equipment's attributes" do 
    Item.equipment_static_attributes(81).should be_true
    attributes = Item.equipment_static_attributes(81)
    lambda{Item.equipment_static_attributes(-1)}.should raise_error
  end

  it "should plus attributes to an equipment" do 
    attributes = {}
    attributes = {"max_power"=>1000, "min_attack"=>5}
    Item.plus_addtional_attributes(attributes, 81).should be_true
  end

  it "should drop durability" do 
    item = prepare_item(81, @character, 1)
    item.durability = 100
    item.save
    item.drop_durability.should be_true
    item.durability.should == 99

    item.drop_durability(100).should be_true
    item.durability.should == 0
  end


  private 
    def prepare_item(item_id, character, amount = 1)
      container = Container.player_container(Vici::ContainerType::BAG_MATERIAL, character.id)
      Item.create :character_id => character.id, :static_item_id => item_id, :quantity => amount, :container_id => container.id
    end

end
