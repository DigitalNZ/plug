# frozen_string_literal: true

# Require engine dependencies
require 'haml-rails'
require 'aasm'

module Plug
  class Engine < ::Rails::Engine
    isolate_namespace Plug

    initializer 'plug.assets.precompile' do |app|
      app.config.assets.precompile += %w[
        plug/application.js plug/application.css plug/favicon.png
      ]
    end

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot
      g.factory_bot dir: 'spec/factories'
    end
  end
end
