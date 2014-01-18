# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eventbrite_gateway/version'

Gem::Specification.new do |spec|
  spec.name          = "eventbrite_gateway"
  spec.version       = EventbriteGateway::VERSION
  spec.authors       = ["Chris Radford"]
  spec.email         = ["chris@chrisradford.com"]
  spec.description   = %q{A gateway implementation for returning Ruby Hashes from the EventBrite API based upon the eventbrite-client gem}
  spec.summary       = %q{A gateway class for the Eventbrite API}
  spec.homepage      = "https://github.com/chrisradford/eventbrite_gateway"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "eventbrite-client", "~> 0.1"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "dotenv"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-minitest"
  spec.add_development_dependency "terminal-notifier-guard"
end
