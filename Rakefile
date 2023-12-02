# typed: strict
# frozen_string_literal: true

require "rake/testtask"
require "rubocop/rake_task"
require "bundler/audit/task"

extend Rake::DSL

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end
task default: :test

RuboCop::RakeTask.new do |t|
  t.options = ["--parallel"]
end

Bundler::Audit::Task.new
