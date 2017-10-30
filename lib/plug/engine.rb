require 'haml'

module Plug
  class Engine < ::Rails::Engine
    isolate_namespace Plug

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
