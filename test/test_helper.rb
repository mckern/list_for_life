require "bundler/setup"
require "minitest/autorun"
require "minitest/reporters"
require "json"

Minitest::Reporters.use! Minitest::Reporters::DefaultReporter.new

if ENV["COVERAGE"]
  require "simplecov"
  SimpleCov.start do
    # exclude common Bundler locations
    %w[.bundle vendor].each { |dir| add_filter dir }
    # exclude test code
    add_filter "test"
  end
end

def fixture_path(filename = "")
  File.join(File.dirname(__FILE__), "fixtures", filename)
end

def read_fixture(file)
  File.read(fixture_path(file))
end
