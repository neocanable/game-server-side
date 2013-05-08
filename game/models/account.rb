require File.expand_path(File.dirname(__FILE__) + "/account/character")
class Account < ActiveRecord::Base
  has_many :characters
end
