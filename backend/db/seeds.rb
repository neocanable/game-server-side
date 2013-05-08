# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

1.upto(32) do |i|
  Mall.create :tab => Vici::MallTab::PROMOTION, :index => i,:static_item_id => 80, :stack => i, :diamond_price => i, :voucher_price => i
  Mall.create :tab => Vici::MallTab::WEAPON, :index => i ,:static_item_id => 80, :stack => i, :diamond_price => i, :voucher_price => i
  Mall.create :tab => Vici::MallTab::ARMOR,:index =>  i ,:static_item_id => 80, :stack => i, :diamond_price => i, :voucher_price => i
  Mall.create :tab => Vici::MallTab::CONSUMABLE, :index => i ,:static_item_id => 80, :stack => i, :diamond_price => i, :voucher_price => i
  Mall.create :tab => Vici::MallTab::MISC, :index => i ,:static_item_id => 80, :stack => i, :diamond_price => i, :voucher_price => i
end
