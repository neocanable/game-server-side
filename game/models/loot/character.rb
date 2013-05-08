class Character < ActiveRecord::Base
  has_many :open_loots

  def open_loot(scene_object)
    open_loots.first(:conditions => ["scene_object_id=?", scene_object.id])
  end
end
