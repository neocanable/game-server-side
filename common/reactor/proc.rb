module Reactor
  # 派生类singleton
  class Proc
    def call(connection, event)
      raise "call should be reload!!!"
    end

    def get_connection(app_name)
      raise "call should be reload!!!"
    end

    def local_call(event)
      event.execute
    end

    def remote_call(connection, event)
      packet = event.dump
      connection.send(packet.pack)
    end
  end
end
