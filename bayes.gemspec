# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bayes/version'

Gem::Specification.new do |spec|
  spec.name          = "bayes"
  spec.version       = Bayes::VERSION
  spec.authors       = ["Hector E. Gomez Morales"]
  spec.email         = ["hectoregm@gmail.com"]
  spec.summary       = %q{Library that implements inference over Bayes Networks.}
  spec.description   = %q{Library that implements inference over Bayes Networks.}
  spec.homepage      = "https://github.com/hectoregm/bayes"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.14"
end
