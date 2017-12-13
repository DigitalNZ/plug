module Plug
  class Feature < ApplicationRecord
    include AASM

    # Validations
    validates :name, presence: { message: 'Feature name is required' },
                     uniqueness: { message: 'Feature name must be unique', case_sensitive: false }
    validates :state, presence: { message: 'Feature state is required' }

    # Callbacks
    before_save { self.slug = name.parameterize }

    # States
    aasm column: :state do
      state :enabled, initial: true
      state :disabled

      event :enable do
        transitions from: :disabled, to: :enabled
      end

      event :disable do
        transitions from: :enabled, to: :disabled
      end
    end
  end
end
