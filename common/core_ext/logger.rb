module CoreExt
  module Logger
    def info_logger
      Vici::INFO_LOGGER
    end
  
    def debug_logger
      Vici::DEBUG_LOGGER
    end
  
    def warn_logger
      Vici::WARN_LOGGER
    end
  
    def error_logger
      Vici::ERROR_LOGGER
    end
  end
end

ActiveRecord::Base.send(:include, CoreExt::Logger)
ActiveRecord::Base.send(:extend, CoreExt::Logger)
