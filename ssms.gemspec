# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ssms/version'

Gem::Specification.new do |spec|
  spec.name          = "ssms"
  spec.version       = SSMS::VERSION
  spec.authors       = ["Ammar Alammar"]
  spec.email         = ["ammar@ammasa.net"]
  spec.summary       = %q{API for ssms.ws}
  spec.description   = %q{Provide a way to send messages and retrive the balance}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_dependency "httparty"
end
