require File.expand_path(File.dirname(__FILE__) + "/../spec")
require File.expand_path(File.dirname(__FILE__) + "/prepare_helper")

describe Container do
  include PrepareHelper

  before do 
    truncate_table("containers")
    prepare_character
    truncate_table("items")
    @item_id   = 60
    @weapon_id = 87

    @consumable_bag = Vici::ContainerType::BAG_CONSUMABLE
    @inventory_bag  = Vici::ContainerType::INVENTORY
  end

  it "should give item to character" do 
    # @item_id这个物品的最大堆叠是5
    container = Container.player_container(@consumable_bag, @character.id)
    changes = container.put_stacking_items_into_container(@item_id,  7)
    changes.include?([container.container_type, 0, @item_id, 5]).should be_true
  end

  it "should take away item" do 
    container = Container.player_container(@consumable_bag, @character.id)
    changes = container.put_stacking_items_into_container(@item_id,  2)
    
    changes = container.take_away_stacking_items(@item_id, 1)
    changes.should == [[container.container_type, 0, @item_id, 1]]
  end

  it "should return character buyback container" do 
    @character.buyback_container.should == @character.containers.first(:conditions => ["container_type=?", Vici::ContainerType::BUYBACK])
  end

  it "should return character armors" do 
    @character.armors.size.should == 0
    container = Container.player_container(@inventory_bag, @character.id)
    item = Item.create :character_id => @character.id, :slot_index => Vici::InventorySlot::FOOT, :container_id => container.id, :static_item_id => @weapon_id


    armors = @character.armors
    armors.should == [item]
  end

  it "should return character weapon" do 
    container = Container.player_container(@inventory_bag, @character.id)
    @character.weapon.should be_nil
    item = Item.create :character_id => @character.id, :slot_index => Vici::InventorySlot::MAIN_HAND, :container_id => container.id, :static_item_id => @weapon_id
  end

end
