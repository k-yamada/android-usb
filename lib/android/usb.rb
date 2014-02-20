require "libusb"
require "android/usb/version"
require "android/usb/cli"
require "pp"

module Android
  module USB
    def self.reset(serial_no)
      device = find_device(:serial_number, serial_no)
      device.open.reset_device
    end

    def self.reset_by(by, value)
      device = find_device(by, value)
      device.open.reset_device
    end

    def self.find_device(by, value)
      usb = LIBUSB::Context.new
      usb.devices.each do |device|
        return device if device.send(by.to_s) == value
      end
      raise "device not found: #{serial_no}"
    end

    def self.devices
      header = [:serial_no, :product, :manufacture, :idVendor,:idProduct]
      print header.join("\t") + "\n"
      usb = LIBUSB::Context.new
      usb.devices.each do |device|
        data = [
          device.serial_number,
          device.product,
          device.manufacturer,
          device.idVendor,
          device.idProduct
        ]
        print data.join("\t") + "\n"
      end
    end
  end
end
