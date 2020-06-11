# frozen_string_literal: true

module Plug
  class Constraint
    def initialize(feature)
      @feature = feature
    end

    def matches?(_request)
      Plug.enabled?(@feature)
    rescue StandardError
      true
    end
  end
end
