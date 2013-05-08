require File.expand_path(File.dirname(__FILE__) + "/party/member")
require File.expand_path(File.dirname(__FILE__) + "/party/loot")
require File.expand_path(File.dirname(__FILE__) + "/party/character")
require File.expand_path(File.dirname(__FILE__) + "/party/invite")
class Party < ActiveRecord::Base
  has_many :characters
end
