module Reactor
  # 派生类singleton
  class EventHandler
    def execute
      raise "execute should reload!!!"
    end

    def before_execute
      raise "before_execute should reload!!!"
    end

    def after_execute
      raise "after_execute should reload!!!"
    end
  end
end
