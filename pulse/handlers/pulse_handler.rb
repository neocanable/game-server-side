module Pulse
#  class SystemChannelCreateFailedEventHandler < PulseEventHandler
#    def execute(event)
#
#    end
#  end

  class << SystemChannelCreateSucceededEventHandler.instance
    def execute(event)
      PulseWorker.instance.system_channel_inited = true    
    end
  end

#  class << PublicSceneCreateFailedEventHandler.instance
#    def execute(event)
#      zone_id = event.zone_id
#      scene_id = event.scene_id
#    end
#  end

  class PublicSceneCreatedEventHandler < PulseEventHandler
    def execute(event)
      scene_id = event.scene_id
      puts "收到#{scene_id}------------------------------------------------------------"
      PulseWorker.instance.remove_public_zone(scene_id)
    end
  end
end

