# frozen_string_literal: true

require 'factory_bot_rails'

FactoryBot.definition_file_paths = %w[spec/factories]

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
