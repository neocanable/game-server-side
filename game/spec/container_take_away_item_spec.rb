require File.expand_path(File.dirname(__FILE__) + "/../spec")
require File.expand_path(File.dirname(__FILE__) + "/prepare_helper")

describe "ContainerTakeAway" do
  include PrepareHelper

  before do 
    truncate_table("items")
    truncate_table("containers")
    prepare_character

    @slot1 = 1
    @item_id = 60
  end

  it "should take away stack items without container index and slot index " do
    container = Container.player_container(Vici::ContainerType::BAG_CONSUMABLE, @character.id)
    item = prepare_item(@item_id, container.id, @character.id, @slot1, 10) 
    changes = Container.take_away_stack_items(@character, @item_id, 1)
    changes.first.should == [container.container_type, @slot1, @item_id, 9]
  end

  it "should take away stack items error when items no enough" do 
    container = Container.player_container(Vici::ContainerType::BAG_CONSUMABLE, @character.id)
    item = prepare_item(@item_id, container.id, @character.id, @slot1, 10) 
    # 10 < 100
    lambda{Container.take_away_stack_items(@character, @item_id, 100)}.should raise_error(NotEnoughItemsError)
  end

  it "should take away items with index" do
    container = Container.player_container(Vici::ContainerType::BAG_CONSUMABLE, @character.id)
    item = prepare_item(@item_id, container.id, @character.id, @slot1, 10)    

    #Container.take_away_items_by_index(character, container_index, slot_index, quantity = nil)
    changes = Container.take_away_items_by_index(@character, container.container_type, @slot1, 1)
    changes.first.should == [container.container_type, @slot1, @item_id, 9]
  end
  
  it "should take away items with index without quantity" do 
    container = Container.player_container(Vici::ContainerType::BAG_CONSUMABLE, @character.id)
    item = prepare_item(@item_id, container.id, @character.id, @slot1, 10)    
    changes = Container.take_away_items_by_index(@character, container.container_type, @slot1, nil)
    changes.first.should == [container.container_type, @slot1, nil, 0]
  end

  it "should raise error when quantity > item.quantity" do 
    container = Container.player_container(Vici::ContainerType::BAG_CONSUMABLE, @character.id)
    item = prepare_item(@item_id, container.id, @character.id, @slot1, 10)    
    # 10 < 20
    lambda{Container.take_away_items_by_index(@character, container.container_type, @slot1, 20)}.should raise_error(NotEnoughItemsError)
  end

  it "should raise error when the item does not exists" do
    null_slot = 6
    
    container = Container.player_container(Vici::ContainerType::BAG_CONSUMABLE, @character.id)
    item = prepare_item(@item_id, container.id, @character.id, @slot1, 10)
    # slot_index: 6 没有东西
    lambda{Container.take_away_items_by_index(@character, container.container_type, null_slot, 20)}.should raise_error(InvalidSlotError)
  end

  private
    def prepare_item(static_item_id, container_id, character_id, slot_index, amount)
      Item.create :static_item_id => static_item_id, :container_id => container_id, :slot_index => slot_index, :quantity => amount, :character_id => character_id
    end

end
