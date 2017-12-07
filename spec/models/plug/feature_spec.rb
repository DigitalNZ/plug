require 'rails_helper'

module Plug
  RSpec.describe Feature, type: :model do
    context 'validations' do
      it { should validate_presence_of(:name).with_message('Feature name is required') }

      # For some reason, shoulda-matchers can't validate uniqueness with message. :(
      it 'validates uniqueness' do
        feature1 = create(:feature, name: 'Unique')
        feature2 = build(:feature, name: 'Unique')
        feature2.valid?

        expect(feature2.errors.messages[:name].first).to eq 'Feature name must be unique'
      end
    end
  end
end
