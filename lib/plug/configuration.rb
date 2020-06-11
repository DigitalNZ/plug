# frozen_string_literal: true

module Plug
  module Configuration
    AUTH_USER         = ''
    AUTH_PASSWORD     = ''
    ALLOW_DELETE      = true

    VALID_OPTIONS_KEYS = %i[
      auth_user
      auth_password
      allow_delete
      buttons
      api_path
      themes
    ].freeze

    attr_accessor(*VALID_OPTIONS_KEYS)

    def configure
      yield self
    end

    def options
      Hash[* VALID_OPTIONS_KEYS.map { |key| [key, send(key)] }.flatten]
    end
  end
end
