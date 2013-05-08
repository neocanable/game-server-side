
require File.expand_path(File.dirname(__FILE__) + "/../spec")
require File.expand_path(File.dirname(__FILE__) + "/prepare_helper")

describe "EquipmentRepair" do
  include PrepareHelper

  before do 
    prepare_character
  end
  
  it "should test item should repair" do 
    item = prepare_item(81, @character, 1)
    item.durability = 1
    item.need_repair?.should be_true
    item.durability = 1000000
    item.need_repair?.should be_false
  end
  
  it "should test equipment is broken" do 
    item = prepare_item(81, @character, 1)
#    item.durability = 0
#    item.is_broken?.should be_true
    item.durability = 1
    item.is_broken?.should be_false
  end

  # TODO
  it "should increase item max durability" do 
    item = prepare_item(81, @character, 1)
    max = item.max_durability
    item.increase_max_durability!
    #item.max_durability.should > max 
  end

#  it "should repair item" do 
#    item = prepare_item(81, @character, 1)
#    durability = item.durability
#    item.durability = 1
#    item.save
#
#    item.repair!
#    item.durability.should ==1 
#  end
  
  private
    def prepare_item(item_id, character, amount = 1)
      container = Container.player_container(Vici::ContainerType::BAG_MATERIAL, character.id)
      Item.create :character_id => character.id, :static_item_id => item_id, :quantity => amount, :container_id => container.id
    end

end
