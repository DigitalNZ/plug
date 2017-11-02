module Plug
  class Plug < ApplicationRecord
    # Validations
    validates :name, presence: true
  end
end
