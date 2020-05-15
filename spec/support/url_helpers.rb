# frozen_string_literal: true

RSpec.configure do |config|
  config.include Plug::Engine.routes.url_helpers
end
