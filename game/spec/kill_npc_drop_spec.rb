require File.expand_path(File.dirname(__FILE__) + "/../spec")
require File.expand_path(File.dirname(__FILE__) + "/prepare_helper")

describe Drop do
  include PrepareHelper

  before do 
    truncate_table("scene_objects")
    truncate_table("scene_object_items")
    prepare_character
  end

  it "should kill npc and got scene_object" do 
    npc_id = 11
    scene_object = prepare_scene_object
    Drop.kill_npc_drop_items(npc_id, scene_object, @character)
    scene_object.scene_object_items.size.should > 0
    SceneObjectItem.find_by_static_item_id(Vici::MONEY_ID).quantity.should >= 1
  end

  private

    def prepare_scene_object
      SceneObject.create :scene_id => 1, :x => 1, :y => 1
    end

end
