class Craft < ActiveRecord::Base
  belongs_to :character
  has_many :recipes,:class_name => "Recipe", :foreign_key => "craft_branch_id", :dependent => :destroy
end
