module Plug
  class SiteNotice < ApplicationRecord
    include AASM
    include Concerns::ModelHelpers
  end
end
