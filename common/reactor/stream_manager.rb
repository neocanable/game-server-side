module Reactor
  class StreamManager
    include Singleton

    def initialize
      @streams = Hash.new
    end
      
    def add(set_name, stream)
      @streams[set_name] = StreamSet.new if @streams[set_name].nil?  
      @streams[set_name].add(stream)
      @streams[set_name]  
    end

    def get(set_name)
      @streams[set_name]
    end

    def remove(set_name, stream)
      @streams[set_name].delete(stream)
    end    
    
    def each_set
      @streams.values.each do |stream_set|
        yield(stream_set)
      end
    end

    def each_stream
      @streams.values.each do |stream_set|
        stream_set.each do |stream|
          yield(stream)
        end
      end
    end

  end
end  
