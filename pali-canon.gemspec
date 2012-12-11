# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pali-canon/version'

Gem::Specification.new do |gem|
  gem.name          = "pali-canon"
  gem.version       = PaliCanon::VERSION
  gem.authors       = ["Alexander K"]
  gem.email         = ["xpyro@ya.ru"]
  gem.description   = %q{there are many uncertainties about this project so I dont know:)}
  gem.summary       = %q{original(pending), translations(pending), site generation software}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rspec_explain'
  gem.add_development_dependency 'cucumber'
  gem.add_development_dependency 'aruba'

  gem.add_dependency 'nanoc'
  gem.add_dependency 'nanoc-oo'
  gem.add_dependency 'thor'

  gem.executables << 'pali-canon'
end
