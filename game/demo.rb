
require 'rubygems'

require 'ruby-debug'

require File.expand_path(File.dirname(__FILE__) + '/../conf/conf') # NND,必须先加载这个配置文件

require File.expand_path(File.dirname(__FILE__) + '/../common/core_ext' )
require File.expand_path(File.dirname(__FILE__) + '/../common/conf' )
require File.expand_path(File.dirname(__FILE__) + '/../common/static_data' )
require File.expand_path(File.dirname(__FILE__) + "/model.rb")
require File.expand_path(File.dirname(__FILE__) + "/spec/prepare_helper.rb")

class Demo
  extend PrepareHelper
end

1.upto(32) do |i| 
  Mall.create :tab => Vici::MallTab::PROMOTION, :index => i,:static_item_id => 80, :stack => i, :diamond_price => i, :voucher_price => i
    Mall.create :tab => Vici::MallTab::WEAPON, :index => i ,:static_item_id => 80, :stack => i, :diamond_price => i, :voucher_price => i
      Mall.create :tab => Vici::MallTab::ARMOR,:index =>  i ,:static_item_id => 80, :stack => i, :diamond_price => i, :voucher_price => i
        Mall.create :tab => Vici::MallTab::CONSUMABLE, :index => i ,:static_item_id => 80, :stack => i, :diamond_price => i, :voucher_price => i
          Mall.create :tab => Vici::MallTab::MISC, :index => i ,:static_item_id => 80, :stack => i, :diamond_price => i, :voucher_price => i
          end


debugger
print "demo"
