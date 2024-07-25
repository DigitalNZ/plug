# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'plug/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'plug'
  s.version     = Plug::VERSION
  s.authors     = %w[Boost DNZ]
  s.email       = ['info@boost.co.nz']
  s.homepage    = 'https://github.com/digitalnz/plug'
  s.summary     = 'Rails engine that can plug/unplug features'
  s.description = 'Rails engine that can plug/unplug features with notice'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'aasm'
  s.add_dependency 'activeresource'
  s.add_dependency 'haml-rails'
  s.add_dependency 'rails', '>= 5.2'

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_bot_rails'
  s.add_development_dependency 'rails-controller-testing'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'sqlite3'
  s.post_install_message = <<~MSG
    ### Upgrading Plug from 0.1.x to 0.2.x ###

    Due to introduction of Vite support, some additional dependencies and configuration will be needed.
    Running `bin/rails g plug:install` will add extra js dependencies and configuration to your project.
    `0.2.x`` doesn't support asset pipelines anymore. Use Vite.js instead.
  MSG
end
