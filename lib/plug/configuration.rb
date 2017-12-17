module Plug
  module Configuration
    AUTH_USER         = ''
    AUTH_PASSWORD     = ''

    VALID_OPTIONS_KEYS = [
      :auth_user,
      :auth_password
    ].freeze

    attr_accessor *VALID_OPTIONS_KEYS

    def configure
      yield self
    end

    def options
      Hash[ * VALID_OPTIONS_KEYS.map { |key| [key, send(key)] }.flatten ]
    end
  end
end