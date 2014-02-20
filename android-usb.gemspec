# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'android/usb/version'

Gem::Specification.new do |spec|
  spec.name          = "android-usb"
  spec.version       = Android::Usb::VERSION
  spec.authors       = ["k-yamada"]
  spec.email         = ["yamadakazu45@gmail.com"]
  spec.description   = %q{android-usb}
  spec.summary       = %q{android-usb}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"

  spec.add_dependency "libusb"
  spec.add_dependency "thor"
end
