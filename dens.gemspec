# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dens/version'

Gem::Specification.new do |spec|
  spec.name          = "Dens"
  spec.version       = Dens::VERSION
  spec.authors       = ["Klaas Pieter Annema"]
  spec.email         = ["klaaspieter@annema.me"]
  spec.summary       = %q{Moves different density assets to their respective Android resource directories}
  spec.description   = %q{Moves different density assets to their respective Android resource directories}
  spec.homepage      = "https://github.com/klaaspieter/dens"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 0"
  spec.add_development_dependency "rspec", "~> 0"
end
