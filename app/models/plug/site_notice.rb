module Plug
  class SiteNotice < ApplicationRecord
    include AASM

    # Validations
    validates :name, presence: { message: 'Site Notice name is required' },
                     uniqueness: { message: 'Site Notice name must be unique', case_sensitive: false }
    validates :state, presence: { message: 'Site Notice state is required' }

    # Callbacks
    before_save { self.slug = name.parameterize }

    # Scopes
    scope :slug_and_name, ->(arg) { where('slug = ? OR name = ?', arg, arg) }

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
