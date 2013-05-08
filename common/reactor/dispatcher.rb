require 'singleton'

module Reactor
  class Dispatcher
  
    def dispatch(connection)
      packets = connection.recv
      return if packets.nil? or packets.size == 0
      packets.each do |packet_str|
        dispatch_packet(connection, packet_str) 
      end
    end

    protected

      def event_hash
        raise "event_hash should be overload!!!"
        # 派生类example code
        #{101 => AccountLoginEvent.instance,
        #i102 => SendMailEvent.instance}
      end
  
    private

      def dispatch_packet(connection, packet_str)
        packet = Packet.new(packet_str)
        event = event_factory(packet, connection)
        event.execute
      end

      def event_factory(packet, connection)
        event = event_hash[packet.get_id]
        raise "EventInstanceNotFoundError" unless event
        event.load(packet, connection)
        event
      end


  end
end
