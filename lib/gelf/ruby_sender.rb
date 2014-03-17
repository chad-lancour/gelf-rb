module GELF
  # Plain Ruby UDP sender.
  class RubyUdpSender
    attr_accessor :addresses

    def initialize(addresses)
      @addresses = addresses
      @i = 0
      #@socket = UDPSocket.open
    end

    def send_datagrams(datagrams)
      host, port = @addresses[@i]
      @i = (@i + 1) % @addresses.length
      socket = UDPSocket.open
      datagrams.each do |datagram|
        socket.send(datagram, 0, host, port)
      end
      socket.close
    end
  end
end
