# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pali-canon/version'

Gem::Specification.new do |gem|
  gem.name          = "pali-canon"
  gem.version       = PaliCanon::VERSION
  gem.authors       = ["Alexander K"]
  gem.email         = ["xpyro@ya.ru"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rspec_explain'

  gem.add_dependency 'nanoc'
  gem.add_dependency 'nanoc-oo'
  # gem.add_dependency 'thor'

  # gem.executables << 'pali-canon'
end
