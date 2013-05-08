module Pulse
  class PulseDispatcher < Reactor::Dispatcher
    include Singleton

    protected
      def event_hash
        {
          106 => ClearCorpsesEvent.instance,
          107 => ClearPartyInviteTimedOutEvent.instance,
          108 => UpdatePlayersVigorEvent.instance,
          115 => ProcessEquipmentTimedOutEvent.instance,
          116 => ProcessGameCenterEvent.instance,
          901 => ProcessEvent.instance,
          501 => SystemUpEvent.instance,
          502 => SystemDownEvent.instance,
          301 => CreateSystemChannelEvent.instance,
          302 => SystemChannelCreateSucceededEvent.instance,
          303 => SystemChannelCreateFailedEvent.instance,
          304 => DestroySystemChannelEvent.instance,
        }
      end
  end
end
