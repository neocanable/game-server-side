module Vici
  class ViciEvent < Reactor::Event
    protected
      def catch_exceptions(exception)
        ErrorInterface.post_error(exception, self._account_id)
        trace(exception)
      end
  end
end  
