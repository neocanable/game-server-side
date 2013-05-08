#          id  106
# description  清除尸体
#         api  .clear_corpses
#      params  tick:int
#        call  pulse
#     execute  vici

module Vici
  class ClearCorpsesEventHandler < ViciEventHandler
    def execute(event)
      tick = event.tick
      raise "Overwrite me!"
    end
  end
end
