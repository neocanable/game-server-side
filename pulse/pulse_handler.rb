require File.expand_path(File.dirname(__FILE__) + '/reactor/pulse_proc_helper')

module Pulse
  class PulseEventHandler < Reactor::EventHandler
    include Singleton
    include ProcHelper

#    # 将vici的逻辑包含进来
#    Pulse::Helpers.constants.each do |helper|
#      include Pulse::Helpers.const_get(helper)
#    end


    def before_execute
      puts "vici event handler before execute"
      true
    end

    def after_execute
      puts "vici event handler after execute"
    end

    private
        
      def vici_info
        PULSE_LOGGER
      end
      
      def connection_manager
        ConnectionManager.instance
      end

  end
end
