#          id  108
# description  恢复玩家精力值
#         api  .update_players_vigor
#      params  tick:int
#        call  pulse
#     execute  vici

module Vici
  class UpdatePlayersVigorEventHandler < ViciEventHandler
    def execute(event)
      tick = event.tick
      raise "Overwrite me!"
    end
  end
end
