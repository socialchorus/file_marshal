# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'file_marshal/version'

Gem::Specification.new do |spec|
  spec.name          = "file_marshal"
  spec.version       = FileMarshal::VERSION
  spec.authors       = ["socialchorus", "Matt Mills", "Kane Baccigalupi"]
  spec.email         = ["developers@socialchorus.com"]
  spec.description   = %q{Serializes files to hashes of strings for serialization over various protocols}
  spec.summary       = %q{Serializes files to hashes of strings for serialization over various protocols}
  spec.homepage      = "http://github.com/socialchorus/file_marshal"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'superbolt'
end
