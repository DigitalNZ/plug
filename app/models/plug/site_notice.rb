# frozen_string_literal: true

module Plug
  class SiteNotice < ApplicationRecord
    include AASM
    include Plug::Concerns::ModelHelpers
  end
end
