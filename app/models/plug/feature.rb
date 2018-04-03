module Plug
  class Feature < ApplicationRecord
    include AASM
    include Plug::Concerns::ModelHelpers
  end
end
