module Plug
  class Constraint
    def initialize(feature)
      @feature = feature
    end

    def matches?(request)
      Plug.enabled?(@feature)
    rescue
      true
    end
  end
end