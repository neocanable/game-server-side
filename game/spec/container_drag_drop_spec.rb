require File.expand_path(File.dirname(__FILE__) + "/../spec")
require File.expand_path(File.dirname(__FILE__) + "/prepare_helper")

describe "ContainerDragDrop" do
  include PrepareHelper

  before do 
    truncate_table("items")
    truncate_table("containers")

    prepare_character
    # 默认给的装备，shit!!!
    truncate_table("items")

    @consumable_bag = Vici::ContainerType::BAG_CONSUMABLE
    @equipment_bag  = Vici::ContainerType::BAG_EQUIPMENT
    @inventoy_bag   = Vici::ContainerType::INVENTORY
  end

  # 堆叠的drag drop
  it "just move from slot_1 to slot_2 STACK" do 
    slot1       = 1
    slot2       = 2
    slot1_count = 3
    slot2_count = 1
    item_id     = 60

    bag_index   = Vici::ContainerType::BAG_CONSUMABLE
    container = Container.player_container(bag_index, @character.id)
    item = prepare_item(item_id, container.id, @character.id, slot1, slot1_count)
    item = prepare_item(item_id, container.id, @character.id, slot2, slot2_count)
    changes = Container.drag_drop(@character, bag_index, slot1, bag_index, slot2)
    changes.should == [ [bag_index, slot2, item_id, slot1_count + slot2_count],[bag_index, slot1, nil, 0]]
  end

  it "just move from slot_1 to slot_2" do 
    bag_index = Vici::ContainerType::BAG_CONSUMABLE
    container = Container.player_container(bag_index, @character.id)
    item_id   = 60
    static_item = static_item(item_id)
    max_stack = static_item["max_stack"].to_i
    slot1     = 1
    slot2     = 2
    slot1_count = 3
    slot2_count = max_stack - 1

    item = prepare_item(60, container.id, @character.id, slot1, slot1_count)
    item = prepare_item(60, container.id, @character.id, slot2, slot2_count)

    changes = Container.drag_drop(@character, bag_index, slot1, bag_index, slot2)
    changes.should == [[bag_index, slot2, item_id, max_stack],[bag_index, slot1, item_id, slot1_count-1]]
  end
  
  # 交换
  it "should swaps to slot" do 
    slot1 = 1
    slot2 = 2
    item1_id = 60
    item2_id = 70
    slot1_count = 1
    slot2_count = 2
    bag_index = Vici::ContainerType::BAG_CONSUMABLE

    container = Container.player_container(bag_index, @character.id)
    item = prepare_item(item1_id, container.id, @character.id, slot1, slot1_count)
    item = prepare_item(item2_id, container.id, @character.id, slot2, slot2_count)   

    changes = Container.drag_drop(@character, bag_index, slot1, bag_index, slot2)
    changes.should == [[bag_index, slot1, item2_id, slot2_count], [bag_index, slot2, item1_id, slot1_count]]
  end

 # 装备 不能移动到消耗物品的背包里
  it "should raise InvalidSlotError" do 
    consumable_bag = Vici::ContainerType::BAG_CONSUMABLE
    equipment_bag  = Vici::ContainerType::BAG_EQUIPMENT
    slot           = 1
    item_id        = 80
    count          = 1

    container = Container.player_container(equipment_bag, @character.id)
    item = prepare_item(item_id, container.id, @character.id, slot, count)

    lambda{Container.drag_drop(@character, equipment_bag, slot, consumable_bag, slot)}.should raise_error
  end


  it "should use weapon" do 
    item_id    = 80
    slot       = 1
    slot_count = 1
    equipment_bag = Vici::ContainerType::BAG_EQUIPMENT
    inventoy_bag  = Vici::ContainerType::INVENTORY
    main_hand     = Vici::InventorySlot::MAIN_HAND

    container = Container.player_container(Vici::ContainerType::BAG_EQUIPMENT, @character.id)
    item = prepare_item(item_id, container.id, @character.id, slot, slot_count)
    changes = Container.drag_drop(@character, equipment_bag, 1, inventoy_bag, main_hand)
    changes.should == [[equipment_bag, slot, nil, 0],[inventoy_bag, main_hand, item_id, slot_count]]
  end

  # 装备双手武器 160000 是双手武器
  it "should use two hand weapon" do 
    item_id    = 80
    slot       = 1
    slot_count = 1
    main_hand  = Vici::InventorySlot::MAIN_HAND
    equipment_bag = Vici::ContainerType::BAG_EQUIPMENT
    inventoy_bag  = Vici::ContainerType::INVENTORY

    container = Container.player_container(equipment_bag, @character.id)
    item = prepare_item(80, container.id, @character.id, slot, slot_count)
    Container.drag_drop(@character, equipment_bag, slot, inventoy_bag, Vici::InventorySlot::MAIN_HAND)
  end

  # 装备双手武器 换下单手武器和盾牌 160000 是双手武器
  it "should use two hand weapon" do 
    container = Container.player_container(Vici::ContainerType::BAG_EQUIPMENT, @character.id)
    inventory_container = Container.player_container(Vici::ContainerType::INVENTORY, @character.id)
    item_1 = prepare_item(81, inventory_container.id, @character.id, Vici::InventorySlot::MAIN_HAND, 1)
    item_2 = prepare_item(84, inventory_container.id, @character.id, Vici::InventorySlot::OFF_HAND, 1)
    item_3 = prepare_item(80, container.id, @character.id, 1, 1)
    Container.drag_drop(@character, Vici::ContainerType::BAG_EQUIPMENT, 1, Vici::ContainerType::INVENTORY, Vici::InventorySlot::MAIN_HAND)

    item_1.reload
    item_2.reload

    item_1.container_id.should == container.id
    item_2.container_id.should == container.id
  end

  
  private
    def prepare_item(static_item_id, container_id, character_id, slot_index, amount)
      Item.create :static_item_id => static_item_id, :container_id => container_id, :slot_index => slot_index, :quantity => amount
    end

end
