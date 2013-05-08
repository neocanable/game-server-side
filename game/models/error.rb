
class ViciError < Exception
  def code
    raise "should not be here!"
  end

  def self.get_code(exception)
    exception.respond_to?(:code) ? exception.code : Vici::Error::INTERNAL
  end
end


Vici::Error.constants.each do |name|
  class_name = name.to_s.split('_').map {|v| v.capitalize }.join
  code = Vici::Error.const_get(name.to_sym)
  eval <<-EOF
    class #{class_name}Error < ViciError
      def code
        #{code}
      end
    end
  EOF
end


class ValidateError < Exception
end
