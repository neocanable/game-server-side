include Reactor
module Vici
  class ViciReactor < Reactor::Base
    include Singleton

    def init
      ViciServerStream.new(VICI_SERVER_HOST, VICI_SERVER_PORT)
      GameCenterClientStream.new(Conf::GAME_CENTER_HOST, Conf::GAME_CENTER_PORT)
    end

    def run
      profiler.profile_begin("main")
      super
      profiler.profile_end("main")
    end

    private
      def profiler
        Profiler.instance
      end

  end
end

