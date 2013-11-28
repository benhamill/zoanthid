# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zoanthid/version'

Gem::Specification.new do |spec|
  spec.name          = "zoanthid"
  spec.version       = Zoanthid::VERSION
  spec.authors       = ["Ben Hamill"]
  spec.email         = ["git-commits@benhamill.com"]
  spec.description   = %q{Zoanthid is a library that interfaces with Rails and RSpec to help you write expressive tests for your HAL API.}
  spec.summary       = %q{Kinda like Capybara for your HAL APIs.}
  spec.homepage      = "https://github.com/benhamill/zoanthid#readme"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"

  spec.add_dependency "cetacean", "~> 1.0"
end
