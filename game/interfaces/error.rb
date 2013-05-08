module Vici
  class ErrorInterface < Interface
    class << self
      def post_error(exception, account_id)
        error_code = ViciError.get_code(exception)
        error(error_code, account_id)  
      end
    end
  end
end  
