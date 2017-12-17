$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'plug/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'plug'
  s.version     = Plug::VERSION
  s.authors     = ['Ben', 'Boost']
  s.email       = ['benedict@boost.co.nz', 'info@boost.co.nz']
  s.homepage    = 'https://github.com/hapiben/plug'
  s.summary     = 'Rails engine that can plug/unplug features'
  s.description = 'Rails engine that can plug/unplug features with notice (WIP)'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '<= 5.1.4'
  s.add_dependency 'sass-rails'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'haml-rails'
  s.add_dependency 'aasm'

  # We don't need these for now
  # s.add_dependency 'jquery-rails'
  # s.add_dependency 'foundation-rails', '~> 6.4.1.2'
  # s.add_dependency 'font-awesome-rails'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails', '~> 3.7.1'
  s.add_development_dependency 'rails-controller-testing', '~> 1.0.2'
  s.add_development_dependency 'factory_bot_rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'shoulda-matchers'
end
