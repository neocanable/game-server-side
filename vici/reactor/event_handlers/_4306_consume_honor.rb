#          id  4306
# description  消耗荣誉
#         api  currency.consume_honor
#      params  character_id amount
#        call  scene_worker
#     execute  vici

module Vici
  class ConsumeHonorEventHandler < ViciEventHandler
    def execute(event)
      character_id = event.character_id
      amount = event.amount
      raise "Overwrite me!"
    end
  end
end
