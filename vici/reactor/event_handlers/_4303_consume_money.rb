#          id  4303
# description  消耗游戏币
#         api  currency.consume_money
#      params  character_id amount
#        call  scene_worker
#     execute  vici

module Vici
  class ConsumeMoneyEventHandler < ViciEventHandler
    def execute(event)
      character_id = event.character_id
      amount = event.amount
      raise "Overwrite me!"
    end
  end
end
