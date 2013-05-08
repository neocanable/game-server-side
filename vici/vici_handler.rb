require File.expand_path(File.dirname(__FILE__) + '/reactor/vici_proc_helper')

module Vici
  class ViciEventHandler < Reactor::EventHandler
    include Singleton
    include ProcHelper

#    # 将vici的逻辑包含进来
#    Vici::Helpers.constants.each do |helper|
#      include Vici::Helpers.const_get(helper)
#    end


    def before_execute
      #profiler.profile_begin(self.class.name)
      true
    end

    def after_execute
      #profiler.profile_end(self.class.name)
    end

    private
        
      def vici_info
        VICI_LOGGER
      end

      def profiler
        Profiler.instance
      end
      
      def connection_manager
        ConnectionManager.instance
      end

  end
end
