# frozen_string_literal: true

require 'rake'
require 'rake/testtask'
require 'rdoc/task'
require 'bundler/gem_tasks'
require 'rubocop/rake_task'

RuboCop::RakeTask.new

desc 'Default: run tests.'
task default: %i[test]

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib' << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.warning = false
end
