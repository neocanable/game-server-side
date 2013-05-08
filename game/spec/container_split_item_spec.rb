require File.expand_path(File.dirname(__FILE__) + "/../spec")
require File.expand_path(File.dirname(__FILE__) + "/prepare_helper")

describe "ContainerSplit" do
  include PrepareHelper

  before do 
    truncate_table("items")
    truncate_table("containers")
    prepare_character

    @bag = Vici::ContainerType::BAG_CONSUMABLE
    @container = Container.player_container(@bag, @character.id)
    @slot1 = 1
    @slot2 = 2
    @item_id = 60
  end

  it "split item into null slot" do 
    item = prepare_item(@item_id, @container.id, @character.id, @slot1, 3)
    item_changes = Container.split(@character, @bag, @slot1, @slot2, 1)
    item_changes.should == [[@bag, @slot1, @item_id, 2],[@bag, @slot2, @item_id, 1]]
  end

  it "should split item into slot whitch has same item" do
    item = prepare_item(@item_id, @container.id, @character.id, @slot1, 3)
    item = prepare_item(@item_id, @container.id, @character.id, @slot2, 1)
    item_changes =  Container.split(@character, @bag, @slot1, @slot2, 1)
    item_changes.should == [[@bag, @slot1, @item_id, 2], [@bag, @slot2, @item_id, 2]]
  end

  it "should split item into slot whitch has same item" do
    static_item = static_item(@item_id)
    item = prepare_item(@item_id, @container.id, @character.id, @slot1, 3)
    item = prepare_item(@item_id, @container.id, @character.id, @slot2, static_item["max_stack"].to_i)
    lambda{Container.split(@character, @bag, @slot1, @slot2, 1)}.should raise_error(InvalidSlotError)
  end

  it "should split error if split_amount >= item.quantity" do
    item = prepare_item(@item_id, @container.id, @character.id, @slot1, 3)
    item = prepare_item(@item_id, @container.id, @character.id, @slot2, 1)
    lambda{Container.split(@character, @bag, @slot1, @slot2, 3)}.should raise_error
    lambda{Container.split(@character, @bag, @slot1, @slot2, 0)}.should raise_error
  end

  private
    def prepare_item(static_item_id, container_id, character_id, slot_index, amount)
      Item.create :static_item_id => static_item_id, :container_id => container_id, :slot_index => slot_index, :quantity => amount
    end

end
