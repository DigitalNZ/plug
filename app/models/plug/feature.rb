module Plug
  class Feature < ApplicationRecord
    # Validations
    validates :name, presence: { message: 'Feature name is required' },
                     uniqueness: { message: 'Feature name must be unique', case_sensitive: false }
  end
end
