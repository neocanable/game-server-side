#          id  6501
# description  发起交易邀请
#         api  trade.trade_initiate
#      params  target_character_id
#        call  client
#     execute  vici

module Vici
  class TradeInitiateEventHandler < ViciEventHandler
    def execute(event)
      target_character_id = event.target_character_id
      raise "Overwrite me!"
    end
  end
end
