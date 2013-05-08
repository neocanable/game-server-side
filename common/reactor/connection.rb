module Reactor
  class Connection
    attr_reader :socket, :connection_info

    def initialize(socket, connection_info = nil)
      @socket          = socket   
      @recv_buffer     = String.new
      @connection_info = connection_info
    end
  
    def send(streamd_packet)
      begin
        puts "send packets: #{streamd_packet}" unless streamd_packet =~ /14001/  # 如果是tick的就不打印
        @socket.send(streamd_packet, 0) 
      rescue Exception => e
        puts "#{e} from send packet"
        raise "StreamDisconnectError"
      end
    end

    def recv
      begin   
        msg = @socket.recv_nonblock(8192)
        raise "StreamDisconnectError" if msg == ""
        @recv_buffer.concat(msg) unless msg.blank?
        puts "recv packets:#{@recv_buffer}"
        streamd_packets
      rescue Errno::EWOULDBLOCK, Errno::EAGAIN
      rescue Exception => e
        puts "抛出异常 #{e} -- from connection "
        raise "StreamDisconnectError" 
      end
    end

    private
      
      # 数据包格式0009[protoal_id, protoal_data]
      def streamd_packets
        data = []
        while(is_buffer_complete?) do
          data << slice_packet
        end
        data
      end
      
      def is_buffer_complete?
        length = @recv_buffer.slice(0..3).to_i
        @recv_buffer.length - 4 >= length
      end

      def slice_packet
        length = @recv_buffer.slice!(0..3).to_i
        @recv_buffer.slice!(0..length-1)
      end
  end
end
