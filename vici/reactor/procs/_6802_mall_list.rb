#          id  6802
# description  商品列表
#         api  mall.mall_list
#      params  tab:int page total_pages:int item[mall_item_id static_item_id stack:int diamond_price:int voucher_price:int]
#        call  vici
#     execute  client

module Vici
  class MallListProc < ViciProc
    include Singleton

    def call(connection, event)
      remote_call(connection, event)
    end
  end
end
