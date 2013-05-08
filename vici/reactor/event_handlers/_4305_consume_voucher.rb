#          id  4305
# description  消耗银票
#         api  currency.consume_voucher
#      params  character_id amount
#        call  scene_worker
#     execute  vici

module Vici
  class ConsumeVoucherEventHandler < ViciEventHandler
    def execute(event)
      character_id = event.character_id
      amount = event.amount
      raise "Overwrite me!"
    end
  end
end
