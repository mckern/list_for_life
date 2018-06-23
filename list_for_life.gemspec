require "time"
require File.join(File.dirname(__FILE__), "lib", "list_for_life")

Gem::Specification.new do |gem|
  gem.name = "list_for_life"
  gem.version = ListForLife::VERSION
  gem.date = Date.today.to_s

  gem.summary = %(Easily consumable simple word list library)
  gem.description = %(Easily build simple word lists)
  gem.license = "MIT"

  gem.authors = ["Ryan McKern"]
  gem.email = "ryan@orangefort.com"
  gem.homepage = "http://github.com/mckern/list_for_life"
  gem.specification_version = 3
  gem.required_ruby_version = ">= 2.1.0"

  gem.require_path = "lib"

  gem.files = Dir["lib/**/*.rb", "CHANGELOG.md", "README.md", "LICENSE"]
  gem.test_files = Dir["Rakefile", "spec/**/*.rb"]
end
