=begin
  clear_corpses(tick)
  clear_party_invite_timed_out(tick)
  update_players_vigor(tick)
  process_equipment_timed_out(tick)
  process_game_center(tick)
  process(current_tick)
  system_up
  system_down
  create_system_channel
  destroy_system_channel
=end
module Pulse
  module ProcHelper
    def clear_corpses(tick)
      event = ClearCorpsesEvent.instance
      event.tick = tick
      connection = connection_manager.game_center
      ClearCorpsesProc.instance.remote_call(connection, event)
    end
    def clear_party_invite_timed_out(tick)
      event = ClearPartyInviteTimedOutEvent.instance
      event.tick = tick
      connection = connection_manager.game_center
      ClearPartyInviteTimedOutProc.instance.remote_call(connection, event)
    end
    def update_players_vigor(tick)
      event = UpdatePlayersVigorEvent.instance
      event.tick = tick
      connection = connection_manager.game_center
      UpdatePlayersVigorProc.instance.remote_call(connection, event)
    end
    def process_equipment_timed_out(tick)
      event = ProcessEquipmentTimedOutEvent.instance
      event.tick = tick
      connection = connection_manager.game_center
      ProcessEquipmentTimedOutProc.instance.remote_call(connection, event)
    end
    def process_game_center(tick)
      event = ProcessGameCenterEvent.instance
      event.tick = tick
      connection = connection_manager.game_center
      ProcessGameCenterProc.instance.remote_call(connection, event)
    end
    def process(current_tick)
      event = ProcessEvent.instance
      event.current_tick = current_tick
      connection = connection_manager.game_center
      ProcessProc.instance.remote_call(connection, event)
    end
    def system_up
      event = SystemUpEvent.instance
      connection = connection_manager.game_center
      SystemUpProc.instance.remote_call(connection, event)
    end
    def system_down
      event = SystemDownEvent.instance
      connection = connection_manager.game_center
      SystemDownProc.instance.remote_call(connection, event)
    end
    def create_system_channel
      event = CreateSystemChannelEvent.instance
      connection = connection_manager.game_center
      CreateSystemChannelProc.instance.remote_call(connection, event)
    end
    def destroy_system_channel
      event = DestroySystemChannelEvent.instance
      connection = connection_manager.game_center
      DestroySystemChannelProc.instance.remote_call(connection, event)
    end
  end
end
