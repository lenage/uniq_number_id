# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uniq_number_id/version'

Gem::Specification.new do |spec|
  spec.name          = 'uniq_number_id'
  spec.version       = UniqNumberId::VERSION
  spec.authors       = ['Yuan He']
  spec.email         = ['lendage@gmail.com']
  spec.summary       = %q{Create uniques random number id for any model in ruby on rails.}
  spec.description   = %q{Add to your models an easily way to generate uniq numbers}
  spec.homepage      = 'https://git.llsapp.com/yuan/uniq_number_id'
  spec.license       = 'MIT'
  spec.required_ruby_version = '~> 1.9'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'activemodel', '~> 3.2'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.1', '>= 3.1.0'
end
