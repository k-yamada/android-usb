# -*- coding: utf-8 -*-
require 'android/usb'
require 'thor'

module Android
  module USB
    class CLI < Thor
      desc "reset <serial no>", "reconnect android device"
      def reset(serial_no)
        USB.reset(serial_no)
      end

      desc "devices", "list all usb devices"
      def devices
        USB.devices
      end
    end
  end
end
