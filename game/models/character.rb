require File.expand_path(File.dirname(__FILE__) + '/character/default_value')
require File.expand_path(File.dirname(__FILE__) + '/character/growth')
require File.expand_path(File.dirname(__FILE__) + '/character/enter_scene')
require File.expand_path(File.dirname(__FILE__) + '/character/validate')
require File.expand_path(File.dirname(__FILE__) + '/character/money')
require File.expand_path(File.dirname(__FILE__) + '/character/spell')
require File.expand_path(File.dirname(__FILE__) + '/character/trade')
require File.expand_path(File.dirname(__FILE__) + '/character/title')
require File.expand_path(File.dirname(__FILE__) + '/character/craft')
require File.expand_path(File.dirname(__FILE__) + '/character/container')

class Character < ActiveRecord::Base
  has_many :containers
  belongs_to :scene
  belongs_to :account

  has_many :mails
  has_many :open_loots
  has_many :crafts
  has_many :recipes
end
