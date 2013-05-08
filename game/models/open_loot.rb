class OpenLoot < ActiveRecord::Base
  belongs_to :scene_object
  belongs_to :character
end
