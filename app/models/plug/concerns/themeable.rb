require 'active_support/concern'

module Plug
  module Concerns
    module Themeable
      extend ActiveSupport::Concern

      included do
        def icon
          theme.split(';').last.split(':').last
        end
      end
    end
  end
end
