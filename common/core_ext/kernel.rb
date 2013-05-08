module Kernel
  def trace_exception(e)
    STDERR.puts e.message
    STDERR.puts e.backtrace.map { |line| "  #{line}" }
  end
end
