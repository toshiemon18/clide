# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'clide/version'

Gem::Specification.new do |spec|
  spec.name          = "clide"
  spec.version       = Clide::VERSION
  spec.authors       = ["toshiemon18"]
  spec.email         = ["st12318@gmail.com"]
  spec.summary       = %q{うぇいw}
  spec.description   = %q{うぇいww}
  spec.homepage      = "https://rubygems.org"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
