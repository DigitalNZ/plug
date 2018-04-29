module Plug
  module Resources
    class SiteNotice < ActiveResource::Base
      self.site = Plug.api_path

      def enabled?
        state == 'enabled'
      end

      def disabled?
        state == 'disabled'
      end

      def icon
        theme.split(';').last.split(':').last
      end
    end
  end
end
