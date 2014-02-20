require "libusb"
require "android/usb/version"
require "android/usb/cli"

module Android
  module USB
    def self.reset(serial_no)
      device = find_device(serial_no)
      device.open.reset_device
    end

    def self.find_device(serial_no)
      usb = LIBUSB::Context.new
      usb.devices.each do |device|
        return device if device.serial_number == serial_no
      end
      raise "device not found: #{serial_no}"
    end

    def self.devices
      print "serial_no\tidVendor\tidProduct\n"
      usb = LIBUSB::Context.new
      usb.devices.each do |device|
        print "#{device.serial_number}\t#{device.idVendor}\t#{device.idProduct}\n"
      end
    end
  end
end
