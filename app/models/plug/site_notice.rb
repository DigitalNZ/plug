module Plug
  class SiteNotice < ApplicationRecord
    include AASM
    include Plug::Concerns::ModelHelpers
    include Plug::Concerns::Themeable
  end
end
