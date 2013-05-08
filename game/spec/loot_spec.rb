
require File.expand_path(File.dirname(__FILE__) + "/../spec")
require File.expand_path(File.dirname(__FILE__) + "/prepare_helper")

describe Loot do
  include PrepareHelper

  before do 
    prepare_character
  end

end
