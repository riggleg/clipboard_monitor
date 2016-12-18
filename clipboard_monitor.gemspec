# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'clipboard_monitor/version'

Gem::Specification.new do |spec|
  spec.name          = "clipboard_monitor"
  spec.version       = ClipboardMonitor::VERSION
  spec.authors       = ["Grant R"]
  spec.email         = ["grantr07@gmail.com"]

  spec.summary       = %q{This is a simple clipboard monitor that emits changes. Only tested on Mac OsX}
  spec.homepage      = "https://github.com/riggleg/clipboard_monitor"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_runtime_dependency 'clipboard', '~> 1.1'
  spec.add_runtime_dependency 'rufus-scheduler', '3.3'
  spec.add_runtime_dependency 'emittr', '>= 0.1'
  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
end
