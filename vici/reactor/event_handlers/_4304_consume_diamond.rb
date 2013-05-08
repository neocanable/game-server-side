#          id  4304
# description  消耗钻石
#         api  currency.consume_diamond
#      params  character_id amount
#        call  scene_worker
#     execute  vici

module Vici
  class ConsumeDiamondEventHandler < ViciEventHandler
    def execute(event)
      character_id = event.character_id
      amount = event.amount
      raise "Overwrite me!"
    end
  end
end
