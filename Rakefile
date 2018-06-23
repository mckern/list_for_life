require "bundler/setup"
require "bundler/gem_tasks"
require "rake/testtask"
require "rubocop/rake_task"

desc "Test list_for_life"
Rake::TestTask.new do |test|
  test.pattern = "test/**/*_test.rb"
  test.verbose = false
  test.warning = false
end

namespace :test do
  desc "Test list_for_life and calculate test coverage"
  task :coverage do
    ENV["COVERAGE"] = "true"
    Rake::Task["test"].invoke
  end
end

desc "Run RuboCop"
RuboCop::RakeTask.new(:rubocop) do |task|
  task.options << "--display-cop-names"
end

desc "Run all spec tests and linters"
task check: %w[test:spec rubocop]

task default: :check
