# Require all dependencies
Gem.loaded_specs['plug'].dependencies.each do |dependency|
 require dependency.name
end

module Plug
  class Engine < ::Rails::Engine
    isolate_namespace Plug

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
