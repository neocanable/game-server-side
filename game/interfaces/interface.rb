module Vici
  class Interface 
    extend InterfaceHelper
    extend StaticHelper
    extend CoreExt::Logger

    class << self
      private
        # 日志
        def logger
          Vici::VICI_INFO_LOGGER
        end
    end  
  end
end
