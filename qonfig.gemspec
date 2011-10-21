# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "qonfig/version"

Gem::Specification.new do |s|
  s.name        = "qonfig"
  s.version     = Qonfig::VERSION
  s.authors     = ["TODO: Write your name"]
  s.email       = ["TODO: Write your email address"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "qonfig"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_runtime_dependency 'activesupport'
  # require 'active_support/core_ext/string/inflections' has a dependency to it
  s.add_runtime_dependency('i18n')

  s.add_development_dependency('turn')
  s.add_development_dependency('rspec')
  s.add_development_dependency('spork')
  s.add_development_dependency('spork-testunit')
  s.add_development_dependency('simplecov')
end
