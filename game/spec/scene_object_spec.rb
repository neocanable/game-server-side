require File.expand_path(File.dirname(__FILE__) + "/../spec")
require File.expand_path(File.dirname(__FILE__) + "/prepare_helper")

describe SceneObject do
  include PrepareHelper

  before do 
    prepare_character
  end

  it "should open scene_object" do
    scene_object = prepare_scene_object
    scene_object.open_item_list!(@character).should be_true
  end

  it "should fill in scene_object" do 
    scene_object = prepare_scene_object
    scene_object.fill_in(80)
    scene_object.scene_object_items.size.should == 1
  end

  it "should test scene_object belongings" do 
    scene_object = prepare_scene_object
    scene_object.belongs_to?(@character).should be_true
  end

  it "should test scene_object's unit_id" do
    scene_object = prepare_scene_object
    scene_object.unit_id.should == 20000000 + scene_object.id
  end

  private
    def prepare_scene_object(character = nil)
      character ||= @character
      SceneObject.create :character_id => character.id,:x => 0, :y => 0, :scene_id => 1
    end

end
