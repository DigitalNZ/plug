# frozen_string_literal: true

module Plug
  module Resources
    class SiteNotice < ActiveResource::Base
      include Plug::Concerns::Themeable

      self.site = Plug.api_path

      def enabled?
        state == 'enabled'
      end

      def disabled?
        state == 'disabled'
      end
    end
  end
end
