%w{code logger table}.each do |file|
  require File.expand_path(File.dirname(__FILE__) + "/../static_data/#{file}")
end

