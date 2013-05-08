require File.expand_path(File.dirname(__FILE__) + "/action_bar/character")
require File.expand_path(File.dirname(__FILE__) + "/action_bar/change")
class ActionBar < ActiveRecord::Base
  belongs_to :characters
end
