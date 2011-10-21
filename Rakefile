require "bundler/gem_tasks"
Bundler::GemHelper.install_tasks

require 'rake/testtask'

Rake::TestTask.new(:spec) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

namespace :spec do
  task :all => ['test']
end

