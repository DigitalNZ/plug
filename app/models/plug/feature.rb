module Plug
  class Feature < ApplicationRecord
    include AASM
    include Concerns::ModelHelpers
  end
end
