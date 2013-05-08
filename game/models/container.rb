require File.expand_path(File.dirname(__FILE__) + "/container/items")
require File.expand_path(File.dirname(__FILE__) + "/container/character")
require File.expand_path(File.dirname(__FILE__) + "/container/check_container")
require File.expand_path(File.dirname(__FILE__) + "/container/drag_drop")
require File.expand_path(File.dirname(__FILE__) + "/container/split")
require File.expand_path(File.dirname(__FILE__) + "/container/stack_item")
require File.expand_path(File.dirname(__FILE__) + "/container/take_away_items")

class Container < ActiveRecord::Base
  has_many :items
  belongs_to :character
end




