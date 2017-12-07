$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "plug/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "plug"
  s.version     = Plug::VERSION
  s.authors     = ["Benedict Aluan"]
  s.email       = ["benedict@boost.co.nz"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Plug."
  s.description = "TODO: Description of Plug."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.4"

  s.add_development_dependency "sqlite3"
end
