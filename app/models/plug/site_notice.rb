module Plug
  class SiteNotice < ApplicationRecord
    include AASM
    include Plug::Concerns::ModelHelpers

    def icon
      theme.split(';').last.split(':').last
    end
  end
end
