# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mgen/version'

Gem::Specification.new do |spec|
  spec.name          = "mgen"
  spec.version       = Mgen::VERSION
  spec.authors       = ["miguel michelson"]
  spec.email         = ["miguelmichelson@gmail.com"]
  spec.description   = "simple mgem generator"
  spec.summary       = "simple mgem generator"
  spec.homepage      = "http://github.com/michelson/mgen"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"

  spec.add_runtime_dependency(%q<colored>,             ["~> 1.2"])
  spec.add_runtime_dependency(%q<rake>,                ["~> 0.9.2"])
  spec.add_runtime_dependency(%q<erubis>,              ["~> 2.7.0"])
  spec.add_runtime_dependency(%q<thor>,                ["~> 0.15.4"])
  spec.add_development_dependency(%q<rspec>,           ["~> 2.6.0"])

end
