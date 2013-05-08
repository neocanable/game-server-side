module Reactor
  class StreamSet 
  include Enumerable

    def initialize
      @set = Array.new
    end

    def add(iostream)
      @set << iostream
    end

    def delete(iostream)
      @set.delete(iostream)
    end

    def size
      @set.size
    end
    
    def last
      @set.last
    end

    def first
      @set.first
    end

    def each
      @set.each do |stream|
        yield(stream)
      end
    end
  end
end  
