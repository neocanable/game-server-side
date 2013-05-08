class SceneObjectItem < ActiveRecord::Base
  belongs_to :scene_object

  def quality
    static_item(self.static_item_id)["quality"].nil? ? Vici::LootThreshold::D : static_item(self.static_item_id)["quality"].to_i
  end

#  def static_item
#    Vici::Code.first(:ITEM, "id", self.static_item_id)
#  end
end
