# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "qonfig/version"

Gem::Specification.new do |s|
  s.name        = "qonfig"
  s.version     = Qonfig::VERSION
  s.authors     = ["Johannes Kaefer"]
  s.email       = ["jak4@qed.io"]
  s.homepage    = ""
  s.summary     = %q{Provide an Interface to config data for all QED projects}
  s.description = %q{Provide an Interface to config data for all QED projects}

  s.rubyforge_project = "qonfig"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_runtime_dependency 'activesupport'
  # require 'active_support/core_ext/string/inflections' has a dependency to ithtop
  s.add_runtime_dependency 'i18n'
  s.add_runtime_dependency 'uuid'

  s.add_development_dependency 'turn'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'spork'
  s.add_development_dependency 'spork-testunit'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'factory_girl'
end
