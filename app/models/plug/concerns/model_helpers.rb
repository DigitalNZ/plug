require 'active_support/concern'

module Plug
  module Concerns
    module ModelHelpers
      extend ActiveSupport::Concern

      included do
        include AASM

        # Validations
        validates :name, presence: { message: "#{self.humanized_class_name} name is required" },
                         uniqueness: { message: "#{self.humanized_class_name} name must be unique", case_sensitive: false }
        validates :state, presence: { message: "#{self.humanized_class_name} state is required" }

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

      module ClassMethods
        def humanized_class_name
          self.name.demodulize.underscore.humanize.capitalize
        end
      end
    end
  end
end
